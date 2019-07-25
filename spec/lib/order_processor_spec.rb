require 'rails_helper'
require 'support/gravity_helper'

describe OrderProcessor, type: :services do
  include_context 'include stripe helper'
  let(:buyer_id) { 'buyer1' }
  let(:seller_id) { 'seller1' }
  let(:order) { Fabricate(:order, buyer_id: buyer_id, fulfillment_type: Order::PICKUP, credit_card_id: 'cc1', seller_id: seller_id) }
  let!(:line_item1) { Fabricate(:line_item, order: order, artwork_id: 'a1', quantity: 1) }
  let(:stub_line_item_1_gravity_deduct) { stub_request(:put, "#{Rails.application.config_for(:gravity)['api_v1_root']}/artwork/a1/inventory").with(body: { deduct: 1 }) }
  let(:stub_line_item_1_gravity_undeduct) { stub_request(:put, "#{Rails.application.config_for(:gravity)['api_v1_root']}/artwork/a1/inventory").with(body: { undeduct: 1 }) }
  let!(:line_item2) { Fabricate(:line_item, order: order, artwork_id: 'a2', quantity: 2) }
  let(:stub_line_item_2_gravity_deduct) { stub_request(:put, "#{Rails.application.config_for(:gravity)['api_v1_root']}/artwork/a2/inventory").with(body: { deduct: 2 }) }
  let(:stub_line_item_2_gravity_undeduct) { stub_request(:put, "#{Rails.application.config_for(:gravity)['api_v1_root']}/artwork/a2/inventory").with(body: { undeduct: 2 }) }

  # stubbed requests
  let(:gravity_partner) { gravity_v1_partner(_id: seller_id) }
  let(:stub_gravity_partner) { stub_request(:get, "#{Rails.application.config_for(:gravity)['api_v1_root']}/partner/seller1/all").to_return(body: gravity_partner.to_json) }
  let(:gravity_merchant_accounts) { [{ external_id: 'ma-1' }] }
  let(:stub_gravity_merchant_account_request) { stub_request(:get, "#{Rails.application.config_for(:gravity)['api_v1_root']}/merchant_accounts?partner_id=seller1").to_return(body: gravity_merchant_accounts.to_json) }
  let(:gravity_credit_card) { { external_id: 'cc_1', customer_account: { external_id: 'ca_1' } } }
  let(:stub_gravity_card_request) { stub_request(:get, "#{Rails.application.config_for(:gravity)['api_v1_root']}/credit_card/cc1").to_return(body: gravity_credit_card.to_json) }
  let(:order_processor) { OrderProcessor.new(order, buyer_id) }

  describe '#hold' do
    context 'invalid order' do
      it 'raises validation error missing shipping info' do
        order.update!(fulfillment_type: nil)
        expect { order_processor.hold! }.to raise_error do |e|
          expect(e.code).to eq :missing_required_info
        end
      end

      it 'raises validation error when missing payment info' do
        order.update!(credit_card_id: nil)
        expect { order_processor.hold! }.to raise_error do |e|
          expect(e.code).to eq :missing_required_info
        end
      end

      it 'raises validation error if you try to process an order that was paid for by wire transfer' do
        order.update!(payment_method: Order::WIRE_TRANSFER)
        expect { order_processor.hold! }.to raise_error do |e|
          expect(e.code).to eq :unsupported_payment_method
        end
      end

      context 'missing credit card info' do
        let(:gravity_credit_card) { { external_id: nil } }
        before do
          stub_gravity_card_request
        end

        it 'raises validation error' do
          expect { order_processor.hold! }.to raise_error do |e|
            expect(e.code).to eq :credit_card_missing_external_id
          end
          expect(stub_gravity_card_request).to have_been_requested
        end
      end
    end

    context 'failed deduct inventory' do
      before do
        stub_gravity_card_request
        stub_gravity_merchant_account_request
        stub_gravity_partner
      end

      it 'does not call stripe' do
        stub_line_item_1_gravity_deduct.to_return(status: 400, body: {}.to_json)
        stub_line_item_2_gravity_deduct.to_return(status: 400, body: {}.to_json)
        expect(PaymentService).not_to receive(:capture_without_hold)
        order_processor.hold!
        expect(stub_line_item_1_gravity_undeduct).not_to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
      end

      it 'handles partial failure' do
        stub_line_item_1_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_deduct.to_return(status: 400, body: {}.to_json)
        stub_line_item_1_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_undeduct
        expect(PaymentService).not_to receive(:capture_without_hold)
        order_processor.hold!
        expect(stub_line_item_1_gravity_undeduct).to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
        expect(order_processor.failed_inventory?).to be true
      end
    end

    context 'failed hold' do
      before do
        stub_gravity_card_request
        stub_gravity_merchant_account_request
        stub_gravity_partner
        stub_line_item_1_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_1_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        prepare_payment_intent_create_failure(status: 'requires_payment_method', charge_error: { code: 'card_declined', decline_code: 'do_not_honor', message: 'The card was declined' })
        order_processor.hold!
      end

      it 'deducts and undeducts inventory' do
        expect(stub_line_item_1_gravity_deduct).to have_been_requested
        expect(stub_line_item_2_gravity_deduct).to have_been_requested
        expect(stub_line_item_1_gravity_undeduct).to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).to have_been_requested
      end

      it 'sets processor transaction' do
        expect(order_processor.transaction.failure_code).to eq 'card_declined'
      end
    end

    context 'successful hold' do
      before do
        stub_gravity_card_request
        stub_gravity_merchant_account_request
        stub_gravity_partner
        stub_line_item_1_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_1_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        prepare_payment_intent_create_success(amount: 20_00)
      end

      it 'deducts inventory' do
        order_processor.hold!
        expect(stub_line_item_1_gravity_deduct).to have_been_requested
        expect(stub_line_item_2_gravity_deduct).to have_been_requested
        expect(stub_line_item_1_gravity_undeduct).not_to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
      end
    end
  end

  describe '#charge' do
    context 'invalid order' do
      it 'raises validation error when missing shipping info' do
        order.update!(fulfillment_type: nil)
        expect { order_processor.charge! }.to raise_error do |e|
          expect(e.code).to eq :missing_required_info
        end
      end

      it 'raises validation error when missing payment info' do
        order.update!(credit_card_id: nil)
        expect { order_processor.charge! }.to raise_error do |e|
          expect(e.code).to eq :missing_required_info
        end
      end

      it 'raises validation error if you try to process an order that was paid for by wire transfer' do
        order.update!(payment_method: Order::WIRE_TRANSFER)
        expect { order_processor.charge! }.to raise_error do |e|
          expect(e.code).to eq :unsupported_payment_method
        end
      end

      context 'missing credit card info' do
        let(:gravity_credit_card) { { external_id: nil } }
        before do
          stub_gravity_card_request
        end

        it 'raises validation error' do
          expect { order_processor.charge! }.to raise_error do |e|
            expect(e.code).to eq :credit_card_missing_external_id
          end
          expect(stub_gravity_card_request).to have_been_requested
        end
      end
    end
    context 'failed deduct inventory' do
      before do
        stub_gravity_card_request
        stub_gravity_merchant_account_request
        stub_gravity_partner
      end

      it 'does not call stripe' do
        stub_line_item_1_gravity_deduct.to_return(status: 400, body: {}.to_json)
        expect(PaymentService).not_to receive(:capture_without_hold)
        order_processor.charge!
        expect(stub_line_item_1_gravity_undeduct).not_to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
        expect(order_processor.failed_inventory?).to be true
      end

      it 'handles partial failure' do
        stub_line_item_1_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_deduct.to_return(status: 400, body: {}.to_json)
        stub_line_item_1_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_undeduct
        expect(PaymentService).not_to receive(:capture_without_hold)
        order_processor.charge!
        expect(stub_line_item_1_gravity_undeduct).to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
        expect(order_processor.failed_inventory?).to be true
      end
    end

    context 'failed charge' do
      before do
        stub_gravity_card_request
        stub_gravity_merchant_account_request
        stub_gravity_partner
        stub_line_item_1_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_1_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        prepare_payment_intent_create_failure(status: 'requires_payment_method', charge_error: { code: 'card_declined', decline_code: 'do_not_honor', message: 'The card was declined' })
        order_processor.charge!
      end

      it 'deducts and undeducts inventory' do
        expect(stub_line_item_1_gravity_deduct).to have_been_requested
        expect(stub_line_item_2_gravity_deduct).to have_been_requested
        expect(stub_line_item_1_gravity_undeduct).to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).to have_been_requested
      end

      it 'raises failed transaction error' do
        expect(order_processor.transaction).to have_attributes(failure_code: 'card_declined', decline_code: 'do_not_honor')
      end
    end

    context 'successful charge' do
      before do
        stub_gravity_card_request
        stub_gravity_merchant_account_request
        stub_gravity_partner
        stub_line_item_1_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_1_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        prepare_payment_intent_create_success(amount: 20_00)
        order_processor.charge!
      end

      it 'deducts inventory' do
        expect(stub_line_item_1_gravity_deduct).to have_been_requested
        expect(stub_line_item_2_gravity_deduct).to have_been_requested
        expect(stub_line_item_1_gravity_undeduct).not_to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
      end
    end
  end
end

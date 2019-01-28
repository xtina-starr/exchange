require 'rails_helper'
require 'support/gravity_helper'
require 'support/use_stripe_mock'

describe OrderProcessor, type: :services do
  include_context 'use stripe mock'
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
  let(:gravity_credit_card) { { external_id: stripe_customer.default_source, customer_account: { external_id: stripe_customer.id } } }
  let(:stub_gravity_card_request) { stub_request(:get, "#{Rails.application.config_for(:gravity)['api_v1_root']}/credit_card/cc1").to_return(body: gravity_credit_card.to_json) }
  let(:order_processor) { OrderProcessor.new(order, buyer_id) }

  describe '#hold' do
    context 'invalid order' do
      context 'missing shipping info' do
        before do
          order.update!(fulfillment_type: nil)
        end
        it 'raises validation error' do
          expect { order_processor.hold }.to raise_error do |e|
            expect(e.code).to eq :missing_required_info
          end
        end
      end
      context 'missing payment info' do
        before do
          order.update!(credit_card_id: nil)
        end
        it 'raises validation error' do
          expect { order_processor.hold }.to raise_error do |e|
            expect(e.code).to eq :missing_required_info
          end
        end
      end
      context 'missing credit card info' do
        let(:gravity_credit_card) { { external_id: nil } }
        before do
          stub_gravity_card_request
        end
        it 'raises validation error' do
          expect { order_processor.hold }.to raise_error do |e|
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
        expect(PaymentService).not_to receive(:create_and_capture_charge)
        expect { order_processor.hold }.to raise_error do |e|
          expect(e.code).to eq :insufficient_inventory
        end
        expect(stub_line_item_1_gravity_undeduct).not_to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
      end
      it 'handles partial failure' do
        stub_line_item_1_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_deduct.to_return(status: 400, body: {}.to_json)
        stub_line_item_1_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_undeduct
        expect(PaymentService).not_to receive(:create_and_capture_charge)
        expect { order_processor.hold }.to raise_error do |e|
          expect(e.code).to eq :insufficient_inventory
        end
        expect(stub_line_item_1_gravity_undeduct).to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
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
        StripeMock.prepare_card_error(:card_declined)
      end
      it 'deducts and undeducts inventory' do
        expect { order_processor.hold }.to raise_error(Errors::ProcessingError)
        expect(stub_line_item_1_gravity_deduct).to have_been_requested
        expect(stub_line_item_2_gravity_deduct).to have_been_requested
        expect(stub_line_item_1_gravity_undeduct).to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).to have_been_requested
      end
      it 'captures the failed transaction' do
        expect { order_processor.hold }.to raise_error(Errors::ProcessingError).and change(order.transactions, :count).by(1)
        expect(order.transactions.first.failure_code).to eq 'card_declined'
      end
      it 'posts failed transaction event' do
        expect { order_processor.hold }.to raise_error(Errors::ProcessingError)
        expect(PostTransactionNotificationJob).to have_been_enqueued
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
        expect(Stripe::Charge).to receive(:create).and_return(uncaptured_charge)
        expect { order_processor.hold }.to change(order.transactions, :count).by(1)
      end
      it 'deducts inventory' do
        expect(stub_line_item_1_gravity_deduct).to have_been_requested
        expect(stub_line_item_2_gravity_deduct).to have_been_requested
        expect(stub_line_item_1_gravity_undeduct).not_to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
      end
      it 'stores successful transaction' do
        expect(order.transactions.first.external_id).to eq uncaptured_charge.id
      end
      it 'does not post failed transaction event' do
        expect(PostTransactionNotificationJob).not_to have_been_enqueued
      end
    end
  end
  describe '#charge' do
    context 'invalid order' do
      context 'missing shipping info' do
        before do
          order.update!(fulfillment_type: nil)
        end
        it 'raises validation error' do
          expect { order_processor.charge }.to raise_error do |e|
            expect(e.code).to eq :missing_required_info
          end
        end
      end
      context 'missing payment info' do
        before do
          order.update!(credit_card_id: nil)
        end
        it 'raises validation error' do
          expect { order_processor.charge }.to raise_error do |e|
            expect(e.code).to eq :missing_required_info
          end
        end
      end
      context 'missing credit card info' do
        let(:gravity_credit_card) { { external_id: nil } }
        before do
          stub_gravity_card_request
        end
        it 'raises validation error' do
          expect { order_processor.charge }.to raise_error do |e|
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
        expect(PaymentService).not_to receive(:create_and_capture_charge)
        expect { order_processor.charge }.to raise_error do |e|
          expect(e.code).to eq :insufficient_inventory
        end
        expect(stub_line_item_1_gravity_undeduct).not_to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
      end
      it 'handles partial failure' do
        stub_line_item_1_gravity_deduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_deduct.to_return(status: 400, body: {}.to_json)
        stub_line_item_1_gravity_undeduct.to_return(status: 200, body: {}.to_json)
        stub_line_item_2_gravity_undeduct
        expect(PaymentService).not_to receive(:create_and_capture_charge)
        expect { order_processor.charge }.to raise_error do |e|
          expect(e.code).to eq :insufficient_inventory
        end
        expect(stub_line_item_1_gravity_undeduct).to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
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
        StripeMock.prepare_card_error(:card_declined)
      end
      it 'deducts and undeducts inventory' do
        expect { order_processor.charge }.to raise_error(Errors::ProcessingError)
        expect(stub_line_item_1_gravity_deduct).to have_been_requested
        expect(stub_line_item_2_gravity_deduct).to have_been_requested
        expect(stub_line_item_1_gravity_undeduct).to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).to have_been_requested
      end
      it 'captures the failed transaction' do
        expect { order_processor.charge }.to raise_error(Errors::ProcessingError).and change(order.transactions, :count).by(1)
        expect(order.transactions.first.failure_code).to eq 'card_declined'
      end
      it 'posts failed transaction event' do
        expect { order_processor.charge }.to raise_error(Errors::ProcessingError)
        expect(PostTransactionNotificationJob).to have_been_enqueued
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
        expect(Stripe::Charge).to receive(:create).and_return(captured_charge)
        expect { order_processor.charge }.to change(order.transactions, :count).by(1)
      end
      it 'deducts inventory' do
        expect(stub_line_item_1_gravity_deduct).to have_been_requested
        expect(stub_line_item_2_gravity_deduct).to have_been_requested
        expect(stub_line_item_1_gravity_undeduct).not_to have_been_requested
        expect(stub_line_item_2_gravity_undeduct).not_to have_been_requested
      end
      it 'stores successful transaction' do
        expect(order.transactions.first.external_id).to eq captured_charge.id
      end
      it 'does not post failed transaction event' do
        expect(PostTransactionNotificationJob).not_to have_been_enqueued
      end
    end
  end
end

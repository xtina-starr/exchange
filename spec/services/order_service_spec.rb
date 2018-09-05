require 'rails_helper'

describe OrderService, type: :services do
  include_context 'use stripe mock'
  let(:order) { Fabricate(:order, external_charge_id: captured_charge.id) }
  let!(:line_items) { [Fabricate(:line_item, order: order, artwork_id: 'a-1', price_cents: 123_00), Fabricate(:line_item, order: order, artwork_id: 'a-2', edition_set_id: 'es-1', quantity: 2, price_cents: 124_00)] }
  let(:user_id) { 'user-id' }

  describe '#approve!' do
    before do
      order.submit!
    end
    context 'with a successful order approval' do
      it 'enqueues a RecordSalesTaxJob for each line item' do
        ActiveJob::Base.queue_adapter = :test
        OrderService.approve!(order)
        line_items.each { |li| expect(RecordSalesTaxJob).to have_been_enqueued.with(li.id) }
      end
    end
  end

  describe '#reject!' do
    let(:artwork_inventory_deduct_request_status) { 200 }
    let(:edition_set_inventory_deduct_request_status) { 200 }
    let(:artwork_inventory_undeduct_request) { stub_request(:put, "#{Rails.application.config_for(:gravity)['api_v1_root']}/artwork/a-1/inventory").with(body: { undeduct: 1 }).to_return(status: artwork_inventory_deduct_request_status, body: {}.to_json) }
    let(:edition_set_inventory_undeduct_request) do
      stub_request(:put, "#{Rails.application.config_for(:gravity)['api_v1_root']}/artwork/a-2/edition_set/es-1/inventory").with(body: { undeduct: 2 }).to_return(status: edition_set_inventory_deduct_request_status, body: {}.to_json)
    end
    before do
      order.update! state: Order::SUBMITTED
    end
    context 'with a successful refund' do
      before do
        artwork_inventory_undeduct_request
        edition_set_inventory_undeduct_request
      end
      it 'calls to undeduct inventory' do
        OrderService.reject!(order, user_id)
        expect(artwork_inventory_undeduct_request).to have_been_requested
        expect(edition_set_inventory_undeduct_request).to have_been_requested
      end
      it 'records the transaction' do
        OrderService.reject!(order, user_id)
        expect(order.transactions.last.external_id).to_not eq nil
        expect(order.transactions.last.transaction_type).to eq Transaction::REFUND
        expect(order.transactions.last.status).to eq Transaction::SUCCESS
      end
      it 'updates the order state' do
        OrderService.reject!(order, user_id)
        expect(order.state).to eq Order::REJECTED
      end
    end
    context 'with an unsuccessful refund' do
      before do
        artwork_inventory_undeduct_request
        edition_set_inventory_undeduct_request
        allow(Stripe::Refund).to receive(:create)
          .with(hash_including(charge: captured_charge.id))
          .and_raise(Stripe::StripeError.new('too late to refund buddy...', json_body: { error: { code: 'something', message: 'refund failed' } }))
        expect { OrderService.reject!(order, user_id) }.to raise_error(Errors::PaymentError).and change(order.transactions, :count).by(1)
      end
      it 'raises a PaymentError and records the transaction' do
        expect(order.transactions.last.external_id).to eq captured_charge.id
        expect(order.transactions.last.transaction_type).to eq Transaction::REFUND
        expect(order.transactions.last.status).to eq Transaction::FAILURE
      end
      it 'does not undeduct inventory' do
        expect(artwork_inventory_undeduct_request).not_to have_been_requested
        expect(edition_set_inventory_undeduct_request).not_to have_been_requested
      end
    end
  end

  describe '#update_totals!' do
    before do
      order.update!(tax_total_cents: 50_00, shipping_total_cents: 50_00, commission_fee_cents: 10_00, transaction_fee_cents: 10_00)
      OrderService.update_totals!(order)
    end
    context 'with no line items' do
      let!(:line_items) { nil }
      it 'updates total fields' do
        expect(order.items_total_cents).to eq 0
        expect(order.buyer_total_cents).to eq 100_00
        expect(order.seller_total_cents).to eq 80_00
      end
    end

    context 'with one line item quantity of 2' do
      it 'returns the sum of the prices of those line items' do
        expect(order.items_total_cents).to eq 371_00
        expect(order.buyer_total_cents).to eq 471_00
        expect(order.seller_total_cents).to eq 451_00
      end
    end

    context 'with a line item that has no price' do
      it 'raises error' do
        order.line_items << Fabricate(:line_item, price_cents: nil)
        expect { OrderService.update_totals!(order) }.to raise_error(Errors::OrderError, 'Missing price info on line items')
      end
    end
  end
end

require 'rails_helper'

describe OrderService, type: :services do
  let(:order) { Fabricate(:order, external_charge_id: captured_charge.id) }
  include_context 'use stripe mock'
  describe '#reject!' do
    before do
      order.update_attributes! state: Order::SUBMITTED
    end
    context 'with a successful refund' do
      it 'records the transaction' do
        OrderService.reject!(order)
        expect(order.transactions.last.external_id).to eq captured_charge.id
        expect(order.transactions.last.transaction_type).to eq Transaction::REFUND
        expect(order.transactions.last.status).to eq Transaction::SUCCESS
      end
      it 'updates the order state' do
        OrderService.reject!(order)
        expect(order.state).to eq Order::REJECTED
      end
    end
    context 'with an unsuccessful refund' do
      it 'raises a PaymentError and records the transaction' do
        StripeMock.prepare_card_error(:card_declined, :new_refund)
        expect { OrderService.reject!(order) }.to raise_error(Errors::PaymentError)
        expect(order.transactions.last.external_id).to eq captured_charge.id
        expect(order.transactions.last.transaction_type).to eq Transaction::REFUND
        expect(order.transactions.last.status).to eq Transaction::FAILURE
      end
    end
  end
end
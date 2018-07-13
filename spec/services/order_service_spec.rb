require 'rails_helper'

describe OrderService, type: :services do
  let(:order) { Fabricate(:order, credit_card_id: 'cc1', merchant_account_id: 'ma1', fulfillment_type: Order::PICKUP) }
  let(:credit_card_id) { 'cc-1' }
  let(:charge_success) { { id: 'ch-1' } }
  let(:charge_failure) { { failure_message: 'some_error' } }

  describe '#submit!' do
    context 'with a successful transaction' do
      before(:each) do
        allow(PaymentService).to receive(:authorize_charge).with(order, order.items_total_cents).and_return(charge_success)
        allow(TransactionService).to receive(:create_success!).with(order, charge_success)
        OrderService.submit!(order)
      end

      it 'authorizes a charge for the full amount of the order' do
        expect(PaymentService).to have_received(:authorize_charge).with(order, order.items_total_cents)
      end

      it 'creates a record of the transaction' do
        expect(TransactionService).to have_received(:create_success!).with(order, charge_success)
      end

      it 'updates the order expiration time' do
        expect(order.state_expires_at).to eq(order.state_updated_at + 2.days)
      end

      it 'updates the order state to SUBMITTED' do
        expect(order.state).to eq Order::SUBMITTED
        expect(order.state_updated_at).not_to be_nil
      end
    end

    context 'with an unsuccessful transaction' do
      it 'creates a record of the transaction' do
        allow(PaymentService).to receive(:authorize_charge).with(order, order.items_total_cents).and_raise(Errors::PaymentError.new('some_error', charge_failure))
        allow(TransactionService).to receive(:create_failure!).with(order, charge_failure)
        expect { OrderService.submit!(order) }.to raise_error(Errors::PaymentError)
        expect(TransactionService).to have_received(:create_failure!).with(order, charge_failure)
      end
    end
  end
end

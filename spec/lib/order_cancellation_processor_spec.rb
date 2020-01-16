require 'rails_helper'

describe OrderCancellationProcessor, type: :services do
  include_context 'include stripe helper'
  let(:order_mode) { Order::BUY }
  let(:payment_method) { Order::CREDIT_CARD }
  let(:order) { Fabricate(:order, external_charge_id: 'pi_1', buyer_id: 'buyer', buyer_type: Order::USER, payment_method: payment_method) }
  let!(:line_items) { [Fabricate(:line_item, order: order, artwork_id: 'a-1', list_price_cents: 123_00), Fabricate(:line_item, order: order, artwork_id: 'a-2', edition_set_id: 'es-1', quantity: 2, list_price_cents: 124_00)] }
  let(:user_id) { 'user-id' }
  let(:processor) { OrderCancellationProcessor.new(order, user_id) }

  describe 'refund_payment' do
    before do
      Fabricate(:transaction, order: order, external_id: 'pi_1', external_type: Transaction::PAYMENT_INTENT)
    end

    it 'raises error when payment method is not credit card' do
      order.update!(payment_method: Order::WIRE_TRANSFER)
      expect { processor.refund_payment }.to raise_error do |e|
        expect(e).to be_a(Errors::ValidationError)
        expect(e.code).to eq :unsupported_payment_method
      end
    end

    it 'stores transaction and raises error when transaction fails' do
      prepare_payment_intent_refund_failure(code: 'something', message: 'refund failed', decline_code: 'failed_refund')
      expect { processor.refund_payment }.to raise_error(Errors::ProcessingError).and change(order.transactions.where(status: Transaction::FAILURE), :count).by(1)
    end

    it 'refunds the payment and stores transaction' do
      prepare_payment_intent_refund_success
      expect { processor.refund_payment }.to change(order.transactions, :count).by(1)
      transaction = order.transactions.order(created_at: :desc).first
      expect(transaction).to have_attributes(external_id: 're_1', transaction_type: Transaction::REFUND, status: Transaction::SUCCESS)
    end
  end

  describe 'cancel_payment' do
    before do
      Fabricate(:transaction, order: order, external_id: 'pi_1', external_type: Transaction::PAYMENT_INTENT)
    end

    it 'raises error when payment method is not credit card' do
      order.update!(payment_method: Order::WIRE_TRANSFER)
      expect { processor.cancel_payment }.to raise_error do |e|
        expect(e).to be_a(Errors::ValidationError)
        expect(e.code).to eq :unsupported_payment_method
      end
    end

    it 'stores transaction and raises error when transaction fails' do
      prepare_payment_intent_cancel_failure(charge_error: { code: 'something', message: 'refund failed', decline_code: 'failed_refund' })
      expect { processor.cancel_payment }.to raise_error(Errors::ProcessingError).and change(order.transactions.where(status: Transaction::FAILURE), :count).by(1)
    end

    it 'refunds the payment and stores transaction' do
      prepare_payment_intent_cancel_success
      expect { processor.cancel_payment }.to change(order.transactions, :count).by(1)
      transaction = order.transactions.order(created_at: :desc).first
      expect(transaction).to have_attributes(external_id: 'pi_1', transaction_type: Transaction::CANCEL, status: Transaction::SUCCESS)
    end
  end

  describe 'queue_undeduct_inventory_jobs' do
    it 'queues undeduct inventory job' do
      processor.queue_undeduct_inventory_jobs
      line_items.each { |li| expect(UndeductLineItemInventoryJob).to have_been_enqueued.with(li.id) }
    end
  end

  describe 'notify' do
    it 'queues posting event for this order' do
      expect(OrderEvent).to receive(:delay_post).once.with(order, user_id)
      processor.notify
    end
  end
end

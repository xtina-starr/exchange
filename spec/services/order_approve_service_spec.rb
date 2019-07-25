require 'rails_helper'

describe OrderApproveService, type: :services do
  include_context 'include stripe helper'
  let(:order) { Fabricate(:order, state: Order::SUBMITTED) }
  let!(:line_items) { [Fabricate(:line_item, order: order, artwork_id: 'a-1', list_price_cents: 123_00), Fabricate(:line_item, order: order, artwork_id: 'a-2', edition_set_id: 'es-1', quantity: 2, list_price_cents: 124_00)] }
  let(:user_id) { 'user-id' }
  let(:service) { OrderApproveService.new(order, user_id) }

  describe '#process!' do
    context 'capture a charge - LEGACY' do
      before do
        Fabricate(:transaction, external_id: 'ch_1', external_type: Transaction::CHARGE, order: order)
        order.update!(external_charge_id: 'ch_1')
      end
      context 'with failed stripe capture' do
        before do
          prepare_charge_capture_failure('ch_1', 'card_declined', 'do_not_honor')
        end

        it 'adds failed transaction' do
          expect { service.process! }.to raise_error(Errors::ProcessingError).and change(order.transactions, :count).by(1)
          transaction = order.transactions.order(created_at: :desc).first
          expect(transaction).to have_attributes(
            status: Transaction::FAILURE,
            failure_code: 'card_declined',
            failure_message: 'The card was declined',
            decline_code: 'do_not_honor'
          )
        end

        it 'keeps order in submitted state' do
          expect { service.process! }.to raise_error(Errors::ProcessingError)
          expect(order.reload.state).to eq Order::SUBMITTED
        end

        it 'does not queue any followup job' do
          expect(OrderEvent).not_to receive(:delay_post)
          expect(OrderFollowUpJob).not_to receive(:set)
          expect(RecordSalesTaxJob).not_to receive(:perform_later)
        end
      end

      context 'with failed post_process' do
        it 'is in approved state' do
          prepare_charge_capture_success('ch_1')
          allow(OrderEvent).to receive(:delay_post).and_raise('Perform what later?!')
          expect { service.process! }.to raise_error(RuntimeError).and change(order.transactions, :count).by(1)
          expect(order.reload.state).to eq Order::APPROVED
        end
      end

      context 'with a successful order approval' do
        before do
          prepare_charge_capture_success('ch_1')
          ActiveJob::Base.queue_adapter = :test
          expect { service.process! }.to change(order.transactions, :count).by(1)
        end

        it 'adds successful transaction' do
          expect(order.transactions.order(created_at: :desc).first.status).to eq Transaction::SUCCESS
        end

        it 'queues PostEvent' do
          expect(PostEventJob).to have_been_enqueued.with('commerce', kind_of(String), 'order.approved')
        end

        it 'queues OrderFollowUpJob' do
          expect(OrderFollowUpJob).to have_been_enqueued.with(order.id, Order::APPROVED)
        end

        it 'enqueues a RecordSalesTaxJob for each line item' do
          line_items.each { |li| expect(RecordSalesTaxJob).to have_been_enqueued.with(li.id) }
        end
      end

      context 'with an order that was paid for by wire transfer' do
        it 'raises an error' do
          order.update!(payment_method: Order::WIRE_TRANSFER)
          expect { service.process! }.to raise_error do |e|
            expect(e.code).to eq :unsupported_payment_method
          end
        end
      end
    end
    context 'capture a payment_intent' do
      before do
        Fabricate(:transaction, external_id: 'pi_1', external_type: Transaction::PAYMENT_INTENT, order: order)
        order.update!(external_charge_id: 'pi_1')
      end
      context 'with failed stripe capture' do
        before do
          prepare_payment_intent_capture_failure(charge_error: { code: 'card_declined', decline_code: 'do_not_honor', message: 'The card was declined' })
        end

        it 'adds failed transaction' do
          expect { service.process! }.to raise_error(Errors::ProcessingError).and change(order.transactions, :count).by(1)
          transaction = order.transactions.order(created_at: :desc).first
          expect(transaction).to have_attributes(
            status: Transaction::FAILURE,
            failure_code: 'card_declined',
            failure_message: 'The card was declined',
            decline_code: 'do_not_honor',
            external_id: 'pi_1',
            external_type: Transaction::PAYMENT_INTENT
          )
        end

        it 'keeps order in submitted state' do
          expect { service.process! }.to raise_error(Errors::ProcessingError)
          expect(order.reload.state).to eq Order::SUBMITTED
        end

        it 'does not queue any followup job' do
          expect(OrderEvent).not_to receive(:delay_post)
          expect(OrderFollowUpJob).not_to receive(:set)
          expect(RecordSalesTaxJob).not_to receive(:perform_later)
        end
      end

      context 'with failed post_process' do
        it 'is in approved state' do
          prepare_payment_intent_capture_success
          allow(OrderEvent).to receive(:delay_post).and_raise('Perform what later?!')
          expect { service.process! }.to raise_error(RuntimeError).and change(order.transactions, :count).by(1)
          expect(order.reload.state).to eq Order::APPROVED
        end
      end

      context 'with a successful order approval' do
        before do
          prepare_payment_intent_capture_success
          ActiveJob::Base.queue_adapter = :test
          expect { service.process! }.to change(order.transactions, :count).by(1)
        end

        it 'adds successful transaction' do
          expect(order.transactions.order(created_at: :desc).first).to have_attributes(
            status: Transaction::SUCCESS,
            external_id: 'pi_1',
            external_type: Transaction::PAYMENT_INTENT
          )
        end

        it 'queues PostEvent' do
          expect(PostEventJob).to have_been_enqueued.with('commerce', kind_of(String), 'order.approved')
        end

        it 'queues OrderFollowUpJob' do
          expect(OrderFollowUpJob).to have_been_enqueued.with(order.id, Order::APPROVED)
        end

        it 'enqueues a RecordSalesTaxJob for each line item' do
          line_items.each { |li| expect(RecordSalesTaxJob).to have_been_enqueued.with(li.id) }
        end
      end

      context 'with an order that was paid for by wire transfer' do
        it 'raises an error' do
          order.update!(payment_method: Order::WIRE_TRANSFER)
          expect { service.process! }.to raise_error do |e|
            expect(e.code).to eq :unsupported_payment_method
          end
        end
      end
    end
  end
end

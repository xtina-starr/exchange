require 'rails_helper'
require 'timecop'

describe ReminderFollowUpJob, type: :job do
  let(:state) { Order::PENDING }
  let(:order) { Fabricate(:order, state: state) }
  describe '#perform' do
    context 'with an order in the same state before its expiration time' do
      context 'SUBMITTED' do
        let(:state) { Order::SUBMITTED }
        it 'sends an internal message to admins about seller lapsing' do
          Timecop.freeze(order.state_expires_at - 1.second) do
            expect(PostNotificationJob).to receive(:perform_now)
              .with(order.id, Order::REMINDER_EVENT_VERB[:pending_approval])

            ReminderFollowUpJob.perform_now(order.id, Order::SUBMITTED)
          end
        end
      end
      context 'APPROVED' do
        let(:state) { Order::APPROVED }
        it 'sends an internal message to admins about buyerr lapsing' do
          Timecop.freeze(order.state_expires_at - 1.second) do
            expect(PostNotificationJob).to receive(:perform_now)
              .with(order.id, Order::REMINDER_EVENT_VERB[:pending_fulfillment])

            ReminderFollowUpJob.perform_now(order.id, Order::APPROVED)
          end
        end
      end
    end
    context 'with an order in a different state than when the job was made' do
      it 'does nothing' do
        order.update!(state: Order::SUBMITTED)
        Timecop.freeze(order.state_expires_at + 1.second) do
          expect(PostNotificationJob).to_not receive(:perform_now)

          ReminderFollowUpJob.perform_now(order.id, Order::PENDING)
        end
      end
    end
    context 'with an order in the same state after its expiration time' do
      it 'does nothing' do
        expect(OrderService).to_not receive(:abandon!)
        expect_any_instance_of(OrderCancellationService).to_not receive(:seller_lapse!)
        ReminderFollowUpJob.perform_now(order.id, Order::PENDING)
      end
    end
  end
end

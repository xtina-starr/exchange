require 'rails_helper'
require 'timecop'

describe OrderInternalFollowUpJob, type: :job do
  let(:state) { Order::PENDING }
  let(:order) { Fabricate(:order, state: state) }
  describe '#perform' do
    context 'with an order in the same state before its expiration time' do
      context 'SUBMITTED' do
        let(:state) { Order::SUBMITTED }
        it 'sends an internal message to admins about seller lapsing' do
          Timecop.freeze(order.state_expires_at + 1.second) do
            expect_any_instance_of(PostNotificationJob).to receive(:perform_later)
              .with(order.id, Order::INTERNAL_EVENT_TOPICS[:seller_delay])

            OrderInternalFollowUpJob.perform_now(order.id, Order::SUBMITTED)
          end
        end
      end
      context 'APPROVED' do
        let(:state) { Order::APPROVED }
        it 'sends an internal message to admins about buyerr lapsing' do
          Timecop.freeze(order.state_expires_at + 1.second) do
            expect_any_instance_of(PostNotificationJob).to receive(:perform_later)
              .with(order.id, Order::INTERNAL_EVENT_TOPICS[:buyer_delay])

            OrderInternalFollowUpJob.perform_now(order.id, Order::APPROVED)
          end
        end
      end
    end
    context 'with an order in a different state than when the job was made' do
      it 'does nothing' do
        order.update!(state: Order::SUBMITTED)
        Timecop.freeze(order.state_expires_at + 1.second) do
          expect(OrderService).to_not receive(:abandon!)
          expect_any_instance_of(OrderCancellationService).to_not receive(:seller_lapse!)
          OrderInternalFollowUpJob.perform_now(order.id, Order::PENDING)
        end
      end
    end
    context 'with an order in the same state after its expiration time' do
      it 'does nothing' do
        expect(OrderService).to_not receive(:abandon!)
        expect_any_instance_of(OrderCancellationService).to_not receive(:seller_lapse!)
        OrderInternalFollowUpJob.perform_now(order.id, Order::PENDING)
      end
    end
  end
end

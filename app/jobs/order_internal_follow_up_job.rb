# Handles alerting our admins early for events like expired
# order submissions from the side of both the seller or
# buyer delaying their responses
#
class OrderInternalFollowUpJob < ApplicationJob
  queue_as :default

  def perform(order_id, state)
    order = Order.find(order_id)
    return unless order.state == state && Time.now <= order.state_expires_at

    case order.state
    when Order::SUBMITTED
      PostNotificationJob.perform_later(@order.id, Order::INTERNAL_EVENT_TOPICS[:seller_delay])

    when Order::APPROVED
      PostNotificationJob.perform_later(@order.id, Order::INTERNAL_EVENT_TOPICS[:buyer_delay])
    end
  end
end

# Note that these messages are not what triggers
# reminder emails. The current use case for these is
# giving admins reminders
class ReminderFollowUpJob < ApplicationJob
  queue_as :default

  def perform(order_id, state)
    order = Order.find(order_id)
    return unless order.state == state && Time.now <= order.state_expires_at

    case order.state
    when Order::SUBMITTED
      PostNotificationJob.perform_now(order.id, Order::REMINDER_EVENT_VERB[:pending_approval])

    when Order::APPROVED
      PostNotificationJob.perform_now(order.id, Order::REMINDER_EVENT_VERB[:pending_fulfillment])
    end
  end
end

class OrderFollowUpJob < ApplicationJob
  queue_as :default

  def perform(order_id, state)
    order = Order.find(order_id)
    return unless order.state == state && Time.now >= order.state_expires_at
    case order.state
    when Order::PENDING
      OrderService.abandon!(order)
    when Order::SUBMITTED
      OrderCancellationService.new(order).seller_lapse!
    when Order::APPROVED
      # Order was approved but has not yet fulfilled,
      # post an event so we can contact partner
      OrderEvent.post(order, 'unfulfilled', nil)
    end
  end
end

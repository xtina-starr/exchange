class ExpireOrderJob < ApplicationJob
  queue_as :default

  def perform(order_id, state)
    order = Order.find(order_id)
    return unless order.state == state && Time.new > order.state_expires_at
    case order.state
    when Order::PENDING
      OrderService.abandon!(order)
    when Order::SUBMITTED, Order::APPROVED
      OrderService.reject!(order)
    end
  end
end

class ExpireOrderJob < ApplicationJob
  queue_as :default

  def perform(order_id, state)
    order = Order.find(order_id)
    return unless order.state == state && Time.new > order.state_expires_at
    OrderService.abandon!(order) if order.state == Order::PENDING
    OrderService.reject!(order) if order.state == Order::SUBMITTED || order.state == Order::APPROVED
  end
end

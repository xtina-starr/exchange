class RejectExpiredOrdersJob < ApplicationJob
  queue_as :default

  def perform(order_id, state)
    order = Order.find(order_id)
    if order.state == state && Time.new > order.state_expires_at
      OrderService.reject!(order)
    end
  end
end

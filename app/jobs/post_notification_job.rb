class PostNotificationJob < ApplicationJob
  queue_as :default

  def perform(order_id, action, user_id)
    order = Order.find(order_id)
    Events::OrderEvent.post(order, action, user_id)
  end
end

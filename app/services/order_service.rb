module OrderService
  def self.set_payment!(order, credit_card_id)
    raise Errors::OrderError, 'Cannot set payment info on non-pending orders' unless order.state == Order::PENDING
    order.update!(credit_card_id: credit_card_id)
    order
  end

  def self.fulfill_at_once!(order, fulfillment, by)
    order.fulfill! do
      fulfillment = Fulfillment.create!(fulfillment.slice(:courier, :tracking_id, :estimated_delivery))
      order.line_items.each do |li|
        li.line_item_fulfillments.create!(fulfillment_id: fulfillment.id)
      end
    end
    PostNotificationJob.perform_later(order.id, Order::FULFILLED, by)
    order
  end

  def self.abandon!(order)
    order.abandon!
  end
end

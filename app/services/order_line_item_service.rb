module OrderLineItemService
  def self.create!(order, line_item_param)
    OrderLineItem.create!(line_item_param.slice(:artwork_id, :edition_set_id, :price_cents).merge(order_id: order.id))
  end
end
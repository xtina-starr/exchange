module LineItemService
  def self.create!(order, line_item_param)
    line_item = LineItem.create!(line_item_param.slice(:artwork_id, :edition_set_id, :price_cents).merge(order_id: order.id))
    # queue fetching gravity artwork
    line_item
  end
end
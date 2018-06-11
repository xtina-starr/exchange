module LineItemService
  def self.create!(order, line_item_param)
    line_item = LineItem.create!(
      artwork_id: line_item_param[:artwork_id],
      edition_set_id: line_item_param[:edition_set_id],
      price_cents: line_item_param[:price_cents],
      order_id: order.id
    )
    # queue fetching gravity artwork
    line_item
  end
end
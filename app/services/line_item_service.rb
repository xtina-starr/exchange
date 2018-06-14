module LineItemService
  def self.create!(order, line_item_param)
    line_item = LineItem.create!(
      artwork_id: line_item_param[:artwork_id],
      edition_set_id: line_item_param[:edition_set_id],
      price_cents: line_item_param[:price_cents],
      order_id: order.id
    )
    # queue fetching gravity artwork
    SetLineItemArtworkJob.perform_later(line_item.id)
    line_item
  end

  def self.set_artwork_snapshot(line_item)
    artwork_snapshot = ArtworkService.snapshot(line_item.artwork_id)
    line_item.update_attributes!(artwork_snapshot: artwork_snapshot)
  end
end
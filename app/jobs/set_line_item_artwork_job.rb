class SetLineItemArtworkJob < ApplicationJob
  queue_as :default

  def perform(line_item_id)
    li = LineItem.find(line_item_id)
    # Do something later
    LineItemService.set_artwork_snapshot(li)
  end
end

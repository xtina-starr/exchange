class UndeductLineItemInventoryJob < ApplicationJob
  queue_as :default

  def perform(line_item_id)
    line_item = LineItem.find(line_item_id)
    Gravity.undeduct_inventory(line_item)
  end
end

class UndeductInventoryJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find(order_id)
    order.line_items.each { |li| Gravity.undeduct_inventory(li) }
  end
end

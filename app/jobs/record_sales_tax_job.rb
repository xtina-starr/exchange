class RecordSalesTaxJob < ApplicationJob
  queue_as :default

  def perform(id)
    line_item = LineItem.find(id)
    order = Order.find(line_item.order_id)
    shipping = {
      country: order.shipping_country,
      postal_code: order.shipping_postal_code,
      region: order.shipping_region,
      city: order.shipping_city,
      address_line_1: order.shipping_address_line1
    }
    SalesTaxService.new(line_item, order.fulfillment_type, shipping, order.shipping_total_cents).record_tax_collected
  end
end

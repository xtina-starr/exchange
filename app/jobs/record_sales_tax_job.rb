class RecordSalesTaxJob < ApplicationJob
  queue_as :default

  def perform(line_item_id)
    line_item = LineItem.find(line_item_id)
    artwork = GravityService.get_artwork(line_item.artwork_id)
    artwork_address = Address.new(artwork[:location])
    shipping_address = Address.new(
      country: line_item.order.shipping_country,
      postal_code: line_item.order.shipping_postal_code,
      region: line_item.order.shipping_region,
      city: line_item.order.shipping_city,
      address_line1: line_item.order.shipping_address_line1
    )
    transaction = SalesTaxService.new(line_item, line_item.order.fulfillment_type, shipping_address, line_item.order.shipping_total_cents, artwork_address).record_tax_collected
    line_item.update!(sales_tax_transaction_id: transaction.transaction_id)
  end
end

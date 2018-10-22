class RecordSalesTaxJob < ApplicationJob
  queue_as :default

  def perform(line_item_id)
    line_item = LineItem.find(line_item_id)
    return unless line_item.should_remit_sales_tax?

    artwork = GravityService.get_artwork(line_item.artwork_id)
    artwork_address = Address.new(artwork[:location])
    seller_addresses = GravityService.fetch_partner_locations(line_item.order.seller_id)
    service = SalesTaxService.new(line_item, line_item.order.fulfillment_type, line_item.order.shipping_address, line_item.order.shipping_total_cents, artwork_address, seller_addresses)
    service.record_tax_collected
    line_item.update!(sales_tax_transaction_id: service.transaction.transaction_id) if service.transaction.present?
  end
end

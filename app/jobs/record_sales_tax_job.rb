class RecordSalesTaxJob < ApplicationJob
  queue_as :default

  def perform(line_item_id)
    line_item = LineItem.find(line_item_id)
    return unless line_item.should_remit_sales_tax?

    artwork = line_item.order.artwork
    artwork_address = Address.new(artwork[:location])
    order = line_item.order
    nexus_addresses = order.nexus_addresses

    service =
      Tax::CollectionService.new(line_item, artwork_address, nexus_addresses)
    service.record_tax_collected
    if service.transaction.present?
      line_item.update!(
        sales_tax_transaction_id: service.transaction.transaction_id
      )
    end
  end
end

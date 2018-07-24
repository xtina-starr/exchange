module SalesTaxService
  def self.calculate_total_sales_tax(order, fulfillment_type, shipping_address)
    origin_address = GravityService.fetch_partner_location(order.partner_id)
    destination_address = fulfillment_type == Order::PICKUP ? origin_address : shipping_address
    order.line_items.map { |li| fetch_sales_tax(li.price_cents, origin_address, destination_address) }.sum
  rescue StandardError => e
    # TODO: 🚨 Add in proper error handling 🚨
    raise Errors::ApplicationError, e.message
  end

  def self.fetch_sales_tax(_price_cents, _origin_address, _destination_address)
    # TODO: 🚨 Add in sales tax API call 🚨
    100
  end

  def self.artsy_should_remit_taxes?(destination_address)
    remitting_states = %w[
      wa
      ca
      nj
      pa
      tx
    ]
    remitting_states.include? destination_address[:shipping_region]
  end
end

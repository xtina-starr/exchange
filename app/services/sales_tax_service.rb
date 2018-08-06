module SalesTaxService
  REMITTING_STATES = %w[
    wa
    nj
    pa
  ].freeze

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
    REMITTING_STATES.include? destination_address[:shipping_region]
  end
end

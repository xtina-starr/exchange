require 'taxjar'
module SalesTaxService
  REMITTING_STATES = %w[
    wa
    nj
    pa
  ].freeze

  def self.calculate_total_sales_tax(order, shipping)
    shipping_address = shipping.slice(
      :shipping_address_line1,
      :shipping_address_line2,
      :shipping_city,
      :shipping_region,
      :shipping_country,
      :shipping_postal_code
    )
    origin_address = GravityService.fetch_partner_location(order.partner_id)
    destination_address = shipping[:fulfillment_type] == Order::PICKUP ? origin_address : shipping_address
    tax = fetch_sales_tax(order, origin_address, destination_address, shipping[:shipping_total_cents])
    tax.amount_to_collect
  rescue Taxjar::Error => e
    raise Errors::OrderError, e.message
  end

  def self.fetch_sales_tax(order, origin_address, destination_address, shipping_total_cents)
    client = Taxjar::Client.new(api_key: Rails.application.config_for(:taxjar)['taxjar_api_key'])
    line_items = order.line_items.map { |li| {
      id: li.id,
      quantity: li.quantity,
      unit_price: li.price_cents
    }}
    # TODO: Figure out how to designate ourselves as merchant of record
    client.tax_for_order({
      from_country: origin_address[:country],
      from_zip: origin_address[:postal_code],
      from_state: origin_address[:state],
      from_city: origin_address[:city],
      from_street: origin_address[:address],
      to_country: destination_address[:shipping_country],
      to_zip: destination_address[:shipping_postal_code],
      to_state: destination_address[:shipping_region],
      to_city: destination_address[:shipping_city],
      to_street: destination_address[:shipping_address_line1],
      shipping: shipping_total_cents,
      line_items: line_items
    })
  end

  def self.artsy_should_remit_taxes?(destination_address)
    REMITTING_STATES.include? destination_address[:shipping_region].downcase
  end
end

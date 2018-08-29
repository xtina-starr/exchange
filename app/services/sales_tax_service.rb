require 'carmen'
require 'taxjar'
require 'unit_converter'

module SalesTaxService
  REMITTING_STATES = %w[
    wa
    nj
    pa
  ].freeze

  def self.calculate_total_sales_tax(order, fulfillment_type, shipping, shipping_total_cents)
    raise 'Dont know how to calculate tax for non-partner sellers' unless order.seller_type == Order::PARTNER
    if fulfillment_type == Order::SHIP
      region = parse_region(shipping[:country], shipping[:region])
      raise Errors::OrderError, 'Could not identify shipping region' if region.nil?
    else
      region = shipping[:region]
    end
    shipping_address = {
      country: shipping[:country],
      postal_code: shipping[:postal_code],
      state: region,
      city: shipping[:city],
      address: shipping[:address_line_1]
    }
    seller_address = GravityService.fetch_partner_location(order.seller_id)
    order.line_items.map { |li| calculate_line_item_sales_tax(li, seller_address, shipping_address, shipping_total_cents, fulfillment_type) }.sum
  end

  def self.calculate_line_item_sales_tax(line_item, seller_address, shipping_address, shipping_total_cents, fulfillment_type)
    artwork = GravityService.get_artwork(line_item.artwork_id)
    origin_address = artwork[:location]
    destination_address = fulfillment_type == Order::PICKUP ? origin_address : shipping_address
    sales_tax = fetch_sales_tax(line_item.price_cents, seller_address, origin_address, destination_address, shipping_total_cents)
    UnitConverter.convert_dollars_to_cents(sales_tax.amount_to_collect)
  rescue Taxjar::Error => e
    raise Errors::OrderError, e.message
  end

  def self.fetch_sales_tax(amount, seller_address, origin_address, destination_address, shipping_total_cents)
    client = Taxjar::Client.new(api_key: Rails.application.config_for(:taxjar)['taxjar_api_key'])
    client.tax_for_order(
      amount: UnitConverter.convert_cents_to_dollars(amount),
      from_country: origin_address[:country],
      from_zip: origin_address[:postal_code],
      from_state: origin_address[:state],
      from_city: origin_address[:city],
      from_street: origin_address[:address],
      to_country: destination_address[:country],
      to_zip: destination_address[:postal_code],
      to_state: destination_address[:state],
      to_city: destination_address[:city],
      to_street: destination_address[:address],
      nexus_addresses: [
        {
          country: seller_address[:country],
          zip: seller_address[:postal_code],
          state: seller_address[:state],
          city: seller_address[:city],
          street: seller_address[:address]
        }
      ],
      shipping: UnitConverter.convert_cents_to_dollars(shipping_total_cents)
    )
  end

  def self.artsy_should_remit_taxes?(destination_address)
    REMITTING_STATES.include? destination_address[:shipping_region].downcase
  end

  def self.parse_region(country, region)
    # TaxJar requires region codes (e.g. "FL") instead of names for the US and Canada
    country = Carmen::Country.coded(country)
    return region unless country&.code == 'US' || country&.code == 'CA'
    parsed_region = country.subregions.named(region) || country.subregions.coded(region)
    parsed_region&.code
  end
end

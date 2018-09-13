class OrderShippingService
  def initialize(order, fulfillment_type:, shipping:)
    @order = order
    @fulfillment_type = fulfillment_type
    @shipping_address = Address.new(shipping)
    @buyer_name = shipping[:name]
    @buyer_phone_number = shipping[:phone_number]
  end

  def process!
    raise Errors::ValidationError.new(:invalid_state, state: @order.state) unless @order.state == Order::PENDING
    Order.transaction do
      attrs = {
        shipping_total_cents: shipping_total_cents,
        tax_total_cents: tax_total_cents
      }
      @order.update!(
        attrs.merge(
          fulfillment_type: @fulfillment_type,
          buyer_phone_number: @buyer_phone_number,
          shipping_name: @buyer_name,
          shipping_address_line1: @shipping_address.street_line1,
          shipping_address_line2: @shipping_address.street_line2,
          shipping_city: @shipping_address.city,
          shipping_region: @shipping_address.region,
          shipping_country: @shipping_address.country,
          shipping_postal_code: @shipping_address.postal_code
        )
      )
      OrderTotalUpdaterService.new(@order).update_totals!
    end
  end

  private

  def artworks
    @artworks ||= Hash[@order.line_items.pluck(:artwork_id).uniq.map do |artwork_id|
      artwork = GravityService.get_artwork(artwork_id)
      validate_artwork!(artwork)
      [artwork[:_id], artwork]
    end]
  end

  def tax_total_cents
    @tax_total_cents ||= @order.line_items.map do |li|
      artwork_address = Address.new(artworks[li.artwork_id][:location])
      service = SalesTaxService.new(li, @fulfillment_type, @shipping_address, shipping_total_cents, artwork_address)
      li.update!(sales_tax_cents: service.sales_tax, should_remit_sales_tax: service.artsy_should_remit_taxes?)
      service.sales_tax
    end.sum
  end

  def validate_artwork!(artwork)
    raise Errors::ValidationError, :unknown_artwork unless artwork
    raise Errors::ValidationError, :missing_artwork_location if artwork[:location].blank?
  end

  def shipping_total_cents
    @shipping_total_cents ||= @order.line_items.map { |li| artwork_shipping_fee(artworks[li.artwork_id]) }.sum
  end

  def artwork_shipping_fee(artwork)
    if @fulfillment_type == Order::PICKUP
      0
    elsif domestic?(artwork[:location])
      calculate_domestic_shipping_fee(artwork)
    else
      calculate_international_shipping_fee(artwork)
    end
  end

  def domestic?(artwork_location)
    artwork_location[:country].casecmp(@shipping_address.country).zero?
  end

  def calculate_domestic_shipping_fee(artwork)
    artwork[:domestic_shipping_fee_cents] || raise(Errors::ValidationError, :missing_domestic_shipping_fee)
  end

  def calculate_international_shipping_fee(artwork)
    artwork[:international_shipping_fee_cents] || raise(Errors::ValidationError, :missing_international_shipping_fee)
  end
end

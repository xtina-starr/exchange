class OrderShippingService
  def initialize(order, fulfillment_type:, shipping:)
    @order = order
    @fulfillment_type = fulfillment_type
    @shipping = shipping
    validate_shipping! if @fulfillment_type == Order::SHIP
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
          buyer_phone_number: @shipping[:phone_number],
          shipping_name: @shipping[:name],
          shipping_address_line1: @shipping[:address_line1],
          shipping_address_line2: @shipping[:address_line2],
          shipping_city: @shipping[:city],
          shipping_region: @shipping[:region],
          shipping_country: @shipping[:country],
          shipping_postal_code: @shipping[:postal_code]
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
      service = SalesTaxService.new(li, @fulfillment_type, @shipping, shipping_total_cents, artworks[li.artwork_id][:location])
      li.update!(sales_tax_cents: service.sales_tax, should_remit_sales_tax: service.artsy_should_remit_taxes?)
      service.sales_tax
    end.sum
  end

  def validate_artwork!(artwork)
    raise Errors::ValidationError, :unknown_artwork unless artwork
    raise Errors::ValidationError, :missing_artwork_location if artwork[:location].blank?
  end

  def validate_shipping!
    raise Errors::ValidationError, :missing_country if @shipping[:country].nil?
    validate_us_shipping! if @shipping[:country] == 'US'
    validate_ca_shipping! if @shipping[:country] == 'CA'
  end

  def validate_us_shipping!
    raise Errors::ValidationError, :missing_region if @shipping[:region].nil?
    raise Errors::ValidationError, :missing_postal_code if @shipping[:postal_code].nil?
  end

  def validate_ca_shipping!
    raise Errors::ValidationError, :missing_region if @shipping[:region].nil?
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
    artwork_location[:country].casecmp(@shipping[:country]).zero?
  end

  def calculate_domestic_shipping_fee(artwork)
    artwork[:domestic_shipping_fee_cents] || raise(Errors::ValidationError, :missing_domestic_shipping_fee)
  end

  def calculate_international_shipping_fee(artwork)
    artwork[:international_shipping_fee_cents] || raise(Errors::ValidationError, :missing_international_shipping_fee)
  end
end

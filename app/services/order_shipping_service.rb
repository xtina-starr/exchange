class OrderShippingService
  def initialize(order, fulfillment_type:, shipping:)
    @order = order
    @fulfillment_type = fulfillment_type
    @shipping = shipping
    @shipping_total_cents = nil
  end

  def process!
    raise Errors::OrderError, 'Cannot set shipping info on non-pending orders' unless @order.state == Order::PENDING
    @shipping_total_cents = @order.line_items.map { |li| ShippingService.calculate_shipping(artwork: artworks[li.artwork_id], shipping_country: @shipping[:country], fulfillment_type: @fulfillment_type) }.sum
    Order.transaction do
      attrs = {
        shipping_total_cents: @shipping_total_cents,
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
    @order
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
      service = SalesTaxService.new(li, @fulfillment_type, @shipping, @shipping_total_cents, artworks[li.artwork_id][:location])
      li.update!(sales_tax_cents: service.sales_tax, should_remit_sales_tax: service.artsy_should_remit_taxes?)
      service.sales_tax
    end.sum
  end

  def validate_artwork!(artwork)
    raise Errors::OrderError, 'Cannot set shipping, unknown artwork' unless artwork
    raise Errors::OrderError, 'Cannot set shipping, missing artwork location' if artwork[:location].blank?
  end
end

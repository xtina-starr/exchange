module OrderDetails
  def artworks
    @artworks ||= Hash[@order.line_items.pluck(:artwork_id).uniq.map do |artwork_id|
      artwork = GravityService.get_artwork(artwork_id)
      validate_artwork!(artwork)
      [artwork[:_id], artwork]
    end]
  end

  def validate_artwork!(artwork)
    raise Errors::ValidationError, :unknown_artwork unless artwork
    raise Errors::ValidationError, :missing_artwork_location if artwork[:location].blank?
  end

  def shipping_total_cents
    @shipping_total_cents ||= @order.line_items.map { |li| ShippingCalculatorService.new(artworks[li.artwork_id], @order.fulfillment_type, @order.shipping_address).shipping_cents }.sum
  end
end

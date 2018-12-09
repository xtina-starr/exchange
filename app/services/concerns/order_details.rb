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

  def credit_card
    @credit_card ||= GravityService.get_credit_card(@order.credit_card_id)
  end

  def partner
    @partner ||= GravityService.fetch_partner(@order.seller_id)
  end

  def merchant_account
    @merchant_account ||= GravityService.get_merchant_account(@order.seller_id)
  end
end

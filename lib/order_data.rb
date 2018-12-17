class OrderData
  def initialize(order)
    @order = order
  end

  def artworks
    @artworks ||= Hash[@order.line_items.pluck(:artwork_id).uniq.map do |artwork_id|
      artwork = Gravity.get_artwork(artwork_id)
      OrderValidator.validate_artwork!(artwork)
      [artwork[:_id], artwork]
    end]
  end

  def shipping_total_cents
    @shipping_total_cents ||= @order.line_items.map { |li| ShippingCalculatorService.new(artworks[li.artwork_id], @order.fulfillment_type, @order.shipping_address).shipping_cents }.sum
  end

  def credit_card
    @credit_card ||= Gravity.get_credit_card(@order.credit_card_id)
  end

  def partner
    @partner ||= Gravity.fetch_partner(@order.seller_id)
  end

  def merchant_account
    @merchant_account ||= Gravity.get_merchant_account(@order.seller_id)
  end

  def seller_locations
    @seller_locations ||= Gravity.fetch_partner_locations(@order.seller_id)
  end

  def commission_rate
    @commission_rate ||= partner[:effective_commission_rate]
  end
end

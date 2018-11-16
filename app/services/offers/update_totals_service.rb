class Offers::UpdateTotalsService
  def initialize(offer)
    @offer = offer
  end

  def process!
    return unless @offer.order.shipping_info?

    @offer.update!(tax_total_cents: tax_total_cents, shipping_total_cents: shipping_total_cents)
  end

  private

  def tax_total_cents
    seller_addresses = GravityService.fetch_partner_locations(@offer.order.seller_id)
    artwork_address = fetch_offer_artwork_address!
    begin
      service = Tax::CalculatorService.new(
        @offer.amount_cents,
        offer_effective_price,
        @offer.order.line_items.first.quantity,
        @offer.order.fulfillment_type,
        @offer.order.shipping_address,
        shipping_total_cents,
        artwork_address,
        seller_addresses
      )
      li.update!(sales_tax_cents: service.sales_tax, should_remit_sales_tax: service.artsy_should_remit_taxes?)
      service.sales_tax
    rescue Errors::ValidationError => e
      raise e unless e.code == :no_taxable_addresses

      # If there are no taxable addresses then we set the sales tax to 0.
      li.update!(sales_tax_cents: 0, should_remit_sales_tax: false)
      0
    end
  end

  def offer_effective_price
    @offer.amount_cents / @offer.order.line_items.first.quantity
  end

  def fetch_offer_artwork_address!
    artwork_id = @offer.line_items.first.artwork_id # this is with assumption of Offer order only having one lineItem
    artwork = GravityService.get_artwork(artwork_id)
    raise Errors::ValidationError, :unknown_artwork unless artwork
    raise Errors::ValidationError, :missing_artwork_location if artwork[:location].blank?

    Address.new(artwork[:location])
  end

  def shipping_total_cents
    @shipping_total_cents ||= @offer.order.shipping_total_cents || ShippingCalculatorService.new(@artwork, @offer.order.fulfillment_type, @shipping_address).shipping_cents
  end
end

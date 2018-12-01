module Offers
  class OfferTotalUpdaterService < BaseTotalUpdaterService
    def initialize(offer:)
      @pending_offer = offer
      @order = offer.order
    end

    def process!
      set_offer_totals!
      set_offer_tax_total_cents!
    end

    private

    attr_reader :offer

    def set_offer_totals!
      @pending_offer.update!(shipping_total_cents: shipping_total_cents)
    end

    def set_offer_tax_total_cents!
      seller_addresses = GravityService.fetch_partner_locations(@order.seller_id)
      artwork_id = @order.line_items.first.artwork_id # this is with assumption of Offer order only having one lineItem
      artwork = @artworks[artwork_id]
      @tax_total_cents ||= begin
        artwork_address = Address.new(artwork[:location])
        begin
          service = Tax::CalculatorService.new(
            @pending_offer.amount_cents,
            @pending_offer.amount_cents / @order.line_items.first.quantity,
            @order.line_items.first.quantity,
            @order.fulfillment_type,
            @order.shipping_address,
            shipping_total_cents,
            artwork_address,
            seller_addresses
          )
          @pending_offer.update!(tax_total_cents: service.sales_tax, should_remit_sales_tax: service.artsy_should_remit_taxes?)
        rescue Errors::ValidationError => e
          raise e unless e.code == :no_taxable_addresses

          # If there are no taxable addresses then we set the sales tax to 0.
          @pending_offer.update!(tax_total_cents: 0, should_remit_sales_tax: false)
        end
      end
    rescue Errors::AddressError => e
      raise Errors::ValidationError, e.code
    end
  end
end

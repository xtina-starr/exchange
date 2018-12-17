module Offers
  class TotalUpdaterService
    def initialize(offer)
      @pending_offer = offer
      @order = offer.order
      @order_data = OrderData.new(@order)
    end

    def process!
      @pending_offer.update!(shipping_total_cents: @order_data.shipping_total_cents)
      set_offer_tax_total_cents
    end

    private

    def set_offer_tax_total_cents
      artwork_id = @order.line_items.first.artwork_id # this is with assumption of Offer order only having one lineItem
      artwork = @order_data.artworks[artwork_id]
      artwork_address = Address.new(artwork[:location])
      service = Tax::CalculatorService.new(
        @pending_offer.amount_cents,
        @pending_offer.amount_cents / @order.line_items.first.quantity,
        @order.line_items.first.quantity,
        @order.fulfillment_type,
        @order.shipping_address,
        @order_data.shipping_total_cents,
        artwork_address,
        @order_data.seller_locations
      )
      sales_tax = @order_data.partner[:artsy_collects_sales_tax] ? service.sales_tax : 0
      @pending_offer.update!(tax_total_cents: sales_tax, should_remit_sales_tax: service.artsy_should_remit_taxes?)
    rescue Errors::ValidationError => e
      raise e unless e.code == :no_taxable_addresses

      # If there are no taxable addresses then we set the sales tax to 0.
      @pending_offer.update!(tax_total_cents: 0, should_remit_sales_tax: false)
    end
  end
end

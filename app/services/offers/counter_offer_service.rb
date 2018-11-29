module Offers
  class CounterOfferService < BaseOfferService
    def initialize(offer:, amount_cents:, from_type:)
      @offer = offer
      @order = offer.order
      @amount_cents = amount_cents
      @from_type = from_type
    end

    def process!
      validate_is_last_offer!
      validate_offer_is_from_buyer!
      validate_order_is_submitted!

      @submitted_at = @from_type == Order::PARTNER ? Time.now.utc : nil
      @pending_offer = @order.offers.create!(
        amount_cents: @amount_cents,
        from_id: @user_id,
        from_type: @from_type,
        creator_id: @user_id,
        responds_to: @offer,
        submitted_at: @submitted_at
      )
      @order.update!(last_offer: @pending_offer)

      # set_offer_totals!

      instrument_offer_counter
    end

    private

    attr_reader :offer

    def instrument_offer_counter
      Exchange.dogstatsd.increment 'offer.counter'
    end

    # TODO REUSE METHODS  form order_submit_service.rb or move to helper

    def set_offer_totals!
      @pending_offer.update!(shipping_total_cents: shipping_total_cents)
      set_offer_tax_total_cents
    end

    def artworks
      @artworks ||= Hash[@order.line_items.pluck(:artwork_id).uniq.map do |artwork_id|
        artwork = GravityService.get_artwork(artwork_id)
        validate_artwork!(artwork)
        [artwork[:_id], artwork]
      end]
    end

    def tax_total_cents
      @tax_total_cents ||= begin
        seller_addresses = GravityService.fetch_partner_locations(@order.seller_id)
        @order.line_items.map do |li|
          artwork_address = Address.new(artworks[li.artwork_id][:location])
          begin
            service = Tax::CalculatorService.new(li.total_amount_cents, li.effective_price_cents, li.quantity, @fulfillment_type, @shipping_address, shipping_total_cents, artwork_address, seller_addresses)
            li.update!(sales_tax_cents: service.sales_tax, should_remit_sales_tax: service.artsy_should_remit_taxes?)
            service.sales_tax
          rescue Errors::ValidationError => e
            raise e unless e.code == :no_taxable_addresses

            # If there are no taxable addresses then we set the sales tax to 0.
            li.update!(sales_tax_cents: 0, should_remit_sales_tax: false)
            0
          end
        end.sum
      end
    rescue Errors::AddressError => e
      raise Errors::ValidationError, e.code
    end

    def set_offer_tax_total_cents
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

    def validate_artwork!(artwork)
      raise Errors::ValidationError, :unknown_artwork unless artwork
      raise Errors::ValidationError, :missing_artwork_location if artwork[:location].blank?
    end

    def shipping_total_cents
      @shipping_total_cents ||= @order.line_items.map { |li| ShippingCalculatorService.new(artworks[li.artwork_id], @fulfillment_type, @shipping_address).shipping_cents }.sum
    end
  end
end

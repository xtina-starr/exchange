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
      # TODO: not to update last offer if it is a pending offer?!?!
      @order.update!(last_offer: @pending_offer)
      totals_service = OfferTotalUpdaterService.new(offer: @pending_offer)
      totals_service.process!

      instrument_offer_counter
    end

    private

    attr_reader :offer

    def instrument_offer_counter
      Exchange.dogstatsd.increment 'offer.counter'
    end
  end
end

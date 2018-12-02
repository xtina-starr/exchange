module Offers
  class SubmitCounterOfferService < BaseOfferService
    def initialize(pending_offer:)
      @offer = pending_offer
      @order = offer.order
    end

    def process!
      # TODO: validate offer_from_my_side
      validate_order_is_submitted!
      validate_offer_not_submitted!(offer)

      @offer.update!(submitted_at: Time.now.utc)
      @order.update!(last_offer: @offer)

      totals_service = OfferTotalUpdaterService.new(offer: @offer)
      totals_service.process!

      instrument_offer_counter
    end

    private

    attr_reader :offer

    def instrument_offer_counter
      Exchange.dogstatsd.increment 'offer.counter.submitted'
    end

    def validate_offer_not_submitted!(offer)
      raise Errors::ValidationError.new(:invalid_state, offer) unless offer.submitted_at.nil?
    end
  end
end

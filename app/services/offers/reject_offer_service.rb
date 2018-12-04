module Offers
  class RejectOfferService
    include OfferValidationService
    def initialize(offer:, reject_reason:, user_id:)
      @offer = offer
      @reject_reason = reject_reason
      @user_id = user_id
    end

    def process!
      validate_is_last_offer!(@offer)
      validate_is_not_own_offer!(@offer, @user_id)

      @offer.order.reject!(@reject_reason)
      instrument_offer_reject
    end

    private

    attr_reader :offer

    def instrument_offer_reject
      Exchange.dogstatsd.increment 'offer.reject'
    end
  end
end

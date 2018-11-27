module Offers
  class RejectOfferService
    def initialize(offer:, reject_reason:)
      @offer = offer
      @reject_reason = reject_reason
    end

    def process!
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

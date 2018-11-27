module Offers
  class RejectOfferService
    def initialize(offer:)
      @offer = offer
    end

    def process!
      @offer.order.reject!
      instrument_offer_reject
    end

    private

    attr_reader :offer

    def instrument_offer_reject
      Exchange.dogstatsd.increment 'offer.reject'
    end
  end
end

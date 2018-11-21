module Offers
  class RejectOfferService
    def initialize(offer:, order:)
      @offer = offer
      @order = order
    end

    def process!
      @order.reject!
      instrument_offer_reject
    end

    private

    attr_reader :order, :offer

    def instrument_offer_reject
      Exchange.dogstatsd.increment 'offer.reject'
    end
  end
end

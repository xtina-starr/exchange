module Offers
  class AcceptService < BaseOfferService
    def initialize(offer:, order:)
      @offer = offer
      @order = order
    end

    def process!
      validate_is_last_offer!
      validate_offer_is_from_buyer!

      order.approve!
      instrument_order_approved
    end

    private

    attr_reader :order, :offer

    def instrument_order_approved
      Exchange.dogstatsd.increment 'order.approve'
    end
  end
end

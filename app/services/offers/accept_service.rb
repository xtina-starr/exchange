module Offers
  class AcceptService
    def initialize(offer:, order:)
      @offer = offer
      @order = order
    end

    def process!
      validate_is_last_offer!

      order.approve!
      instrument_order_approved
    end

    private

    attr_reader :order, :offer

    def validate_is_last_offer!
      raise Errors::ValidationError.new(:not_last_offer, offer) unless offer.last_offer?
    end

    def instrument_order_approved
      Exchange.dogstatsd.increment 'order.approve'
    end
  end
end

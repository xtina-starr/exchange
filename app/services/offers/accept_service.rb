module Offers
  class AcceptService
    def initialize(offer:, order:)
      @offer = offer
      @order = order
    end

    def process!
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

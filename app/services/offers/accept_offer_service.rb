module Offers
  class AcceptOfferService
    include OfferValidationService
    def initialize(offer:, order:, user_id:)
      @offer = offer
      @order = order
      @user_id = user_id
    end

    def process!
      # Deduct artwork from inventory
      # Charge buyer
      validate_is_last_offer!

      order.approve!

      publish_order_approved
      instrument_order_approved
    end

    private

    attr_reader :order, :offer, :user_id

    def publish_order_approved
      PostOrderNotificationJob.perform_later(order.id, Order::APPROVED, user_id)
    end

    def instrument_order_approved
      Exchange.dogstatsd.increment 'order.approve'
    end
  end
end

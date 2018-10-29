module Offers
  class BuyerCreateService
    def initialize(order, amount_cents, user_id)
      @order = order
      @amount_cents = amount_cents
      @user_id = user_id
    end

    def process!
      assert_offer!
      @order.negotiate! do
        @order.offers.create!(amount_cents: @amount_cents, offerer_id: @user_id, offerer_type: Order::USER, offered_by: @user_id)
      end
    end

    private

    def assert_offer!
      raise Errors::ValidationError(:invalid_amount_cents) unless @amount_cents.positive?
      raise Errors::ValidationError(:cant_offer) unless @order.mode == Order::OFFER && [Order::PENDING, Order::NEGOTIATION].include?(@order.state)
    end
  end
end

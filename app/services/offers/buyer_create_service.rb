module Offers
  class BuyerCreateService
    def initialize(order, amount_cents, user_id)
      @order = order
      @amount_cents = amount_cents
      @user_id = user_id
    end

    def process!
      assert_offer!
      @order.with_lock do
        offer = @order.offers.create!(amount_cents: @amount_cents, from_id: @user_id, from_type: Order::USER, creator_id: @user_id)
        @order.update!(last_offer: offer, state_expires_at: 2.days.from_now)
      end
    end

    private

    def assert_offer!
      raise Errors::ValidationError, :invalid_amount_cents unless @amount_cents.present? && @amount_cents.positive?
      raise Errors::ValidationError, :cant_offer unless @order.mode == Order::OFFER && @order.offerable?
    end
  end
end

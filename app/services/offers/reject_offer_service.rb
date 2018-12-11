module Offers
  class RejectOfferService
    def initialize(offer:, reject_reason:, user_id:)
      @offer = offer
      @reject_reason = reject_reason
      @user_id = user_id
    end

    def process!
      pre_process!

      @offer.order.reject!(@reject_reason)

      post_process!
    end

    private

    def pre_process!
      OrderValidator.validate_is_last_offer!(@offer)
    end

    def post_process!
      Exchange.dogstatsd.increment 'offer.reject'
    end
  end
end

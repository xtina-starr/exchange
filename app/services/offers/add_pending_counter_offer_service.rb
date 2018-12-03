module Offers
  class AddPendingCounterOfferService < BaseOfferService
    def initialize(offer:, amount_cents:, from_id:, from_type:)
      @offer = offer
      @order = offer.order
      @amount_cents = amount_cents
      @from_id = from_id
      @from_type = from_type
    end

    def process!
      validate_is_last_offer!
      validate_offer_is_from_buyer! # TODO: generalize to offer_from_other_side
      validate_order_is_submitted!

      @pending_offer = @order.offers.create!(
        amount_cents: @amount_cents,
        from_id: @from_id,
        from_type: @from_type,
        creator_id: @from_id,
        responds_to: @offer
      )
      totals_service = OfferTotalUpdaterService.new(offer: @pending_offer)
      totals_service.process!

      @pending_offer
    end

    private

    attr_reader :offer
  end
end

module Offers
  class AddPendingCounterOfferService
    attr_reader :offer
    def initialize(responds_to, amount_cents:, from_id:, from_type:, creator_id:)
      @responds_to = responds_to
      @order = responds_to.order
      @amount_cents = amount_cents
      @from_id = from_id
      @creator_id = creator_id
      @from_type = from_type
    end

    def process!
      validate_action!

      @offer = @order.offers.create!(
        amount_cents: @amount_cents,
        from_id: @from_id,
        from_type: @from_type,
        creator_id: @creator_id,
        responds_to: @responds_to
      )
      totals_service = Offers::TotalUpdaterService.new(@offer)
      totals_service.process!
    end

    private

    def validate_action!
      OrderValidator.validate_is_last_offer!(@responds_to)
      OrderValidator.validate_order_submitted!(@responds_to.order)
    end
  end
end

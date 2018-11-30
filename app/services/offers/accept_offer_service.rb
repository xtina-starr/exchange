module Offers
  class AcceptOfferService < CommitOrderService
    include OfferValidationService
    attr_reader :order, :offer, user_id
    def initialize(offer:, order:, user_id: nil)
      super(order, :approve!, user_id)
      @offer = offer
    end

    private
    
    def process_payment
      super
      @transaction = PaymentService.create_and_capture_charge(construct_charge_params)
      raise Errors::ProcessingError.new(:capture_failed, @transaction.failure_data) if @transaction.failed?
    end

    def pre_process!
      super
      validate_is_last_offer!(@offer)
      validate_offer_is_from_buyer!(@offer)
    end
  end
end

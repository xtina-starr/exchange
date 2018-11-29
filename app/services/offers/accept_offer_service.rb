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
      @transaction = PaymentService.create_charge(construct_charge_params(capture: true))
      raise Errors::ProcessingError.new(:charge_failed, @transaction.failure_data) if @transaction.failed?
    end

    def pre_process!
      super
      validate_is_last_offer!
    end

    def post_process!
      super
      instrument_order_approved
    end

    def instrument_order_approved
      Exchange.dogstatsd.increment 'order.approve'
    end
  end
end

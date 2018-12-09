module Offers
  class AcceptOfferService < CommitOrderService
    include OrderValidator
    attr_reader :offer, :user_id
    def initialize(offer, user_id: nil)
      @offer = offer
      super(@offer.order, :approve, user_id)
    end

    private

    def process_payment
      @transaction = PaymentService.create_and_capture_charge(construct_charge_params)
      raise Errors::ProcessingError.new(:capture_failed, @transaction.failure_data) if @transaction.failed?
    end

    def pre_process!
      super
      validate_is_last_offer!(@offer)
    end

    def post_process!
      super
      PostOrderNotificationJob.perform_later(@order.id, Order::APPROVED, @user_id)
    end
  end
end

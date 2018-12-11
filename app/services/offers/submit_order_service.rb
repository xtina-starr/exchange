module Offers
  class SubmitOrderService
    attr_reader :order, :offer

    def initialize(offer, user_id: nil)
      @offer = offer
      @order = @offer.order
      @user_id = user_id
      @order_data = OrderData.new(@order)
    end

    def process!
      pre_process!
      @order.submit! do
        SubmitOfferService.new(@offer).process!
      end
      post_process
    end

    private

    def pre_process!
      assert_can_submit!

      OrderValidator.validate_artwork_versions!(order)
      OrderValidator.validate_credit_card!(@order_data.credit_card)
    end

    def post_process
      Exchange.dogstatsd.increment 'order.submit'
      PostOrderNotificationJob.perform_later(@order.id, Order::SUBMITTED, @user_id)
      OrderFollowUpJob.set(wait_until: @order.state_expires_at).perform_later(@order.id, @order.state)
      ReminderFollowUpJob.set(wait_until: @order.state_expires_at - 2.hours).perform_later(@order.id, @order.state)
    end

    def assert_can_submit!
      raise Errors::ValidationError, :cant_submit unless @order.mode == Order::OFFER
      raise Errors::ValidationError, :missing_required_info unless @order.can_commit?
    end
  end
end

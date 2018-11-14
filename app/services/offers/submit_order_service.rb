module Offers
  class SubmitOrderService
    attr_reader :order, :offer
    def initialize(offer, by: nil)
      @offer = offer
      @order = @offer.order
      @by = by
    end

    def process!
      assert_can_submit!
      @order.submit! do
        @offer.update!(submitted_at: Time.now.utc)
        @order.update!(last_offer: @offer)
      end
      post_process
    end

    private

    def post_process
      Exchange.dogstatsd.increment 'order.submit'
      PostNotificationJob.perform_later(@order.id, Order::SUBMITTED, @by)
      OrderFollowUpJob.set(wait_until: @order.state_expires_at).perform_later(@order.id, @order.state)
      ReminderFollowUpJob.set(wait_until: @order.state_expires_at - 2.hours).perform_later(@order.id, @order.state)
    end

    def assert_can_submit!
      raise Errors::ValidationError, :cant_submit unless @order.mode == Order::OFFER
      raise Errors::ValidationError, :missing_required_info unless @order.can_submit?
      raise Errors::ValidationError, :invalid_offer if @offer.submitted?
    end
  end
end

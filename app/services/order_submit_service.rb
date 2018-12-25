class OrderSubmitService < CommitOrderService
  def self.call!(order, user_id: nil)
    new(order, user_id).process!
  end

  def initialize(order, user_id)
    super(order, :submit, user_id)
  end

  private

  def pre_process!
    OrderValidator.validate_artwork_versions!(order)
    super
  end

  def process_payment
    @transaction = PaymentService.create_and_authorize_charge(construct_charge_params)
    raise Errors::ProcessingError.new(:charge_authorization_failed, @transaction) if @transaction.failed?
  end

  def post_process!
    super
    OrderEvent.delay_post(@order, Order::SUBMITTED, @user_id)
    OrderFollowUpJob.set(wait_until: @order.state_expires_at).perform_later(@order.id, @order.state)
    ReminderFollowUpJob.set(wait_until: @order.state_expires_at - 2.hours).perform_later(@order.id, @order.state)
  end
end

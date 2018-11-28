class OrderSubmitService < CommitOrderService
  def self.call!(order, user_id: nil)
    new(order, user_id).process!
  end

  def initialize(order, user_id)
    super(order, :submit!, user_id)
  end

  private
  
  def process_payment
    super
    @transaction = PaymentService.authorize_charge(construct_charge_params(capture: false))
    raise Errors::ProcessingError.new(:charge_authorization_failed, @transaction) if @transaction.failed?
  end

  def pre_process!
    super
    raise Errors::ValidationError, :missing_required_info unless @order.can_submit?
  end

  def post_process!
    super
    Exchange.dogstatsd.increment 'order.submit'
    PostOrderNotificationJob.perform_later(@order.id, Order::SUBMITTED, @user_id)
    OrderFollowUpJob.set(wait_until: @order.state_expires_at).perform_later(@order.id, @order.state)
    ReminderFollowUpJob.set(wait_until: @order.state_expires_at - 2.hours).perform_later(@order.id, @order.state)
  end
end

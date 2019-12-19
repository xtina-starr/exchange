class OrderCancellationService
  def initialize(order, user_id = nil)
    @order = order
    @user_id = user_id
    @transaction = nil
    @payment_service = PaymentService.new(@order)
  end

  def seller_lapse!
    @order.seller_lapse! do
      cancel_payment_intent if @order.mode == Order::BUY
    end
    process_inventory_undeduction
    OrderEvent.delay_post(@order)
  ensure
    @order.transactions << @transaction if @transaction.present?
  end

  def buyer_lapse!
    @order.buyer_lapse!
    OrderEvent.delay_post(@order)
  end

  def reject!(rejection_reason = nil)
    @order.reject!(rejection_reason) do
      cancel_payment_intent if @order.mode == Order::BUY
    end
    process_inventory_undeduction if @order.mode == Order::BUY
    Exchange.dogstatsd.increment 'order.reject'
    OrderEvent.delay_post(@order, @user_id)
  ensure
    @order.transactions << @transaction if @transaction.present?
  end

  def refund!
    @order.refund! do
      process_stripe_refund
    end
    record_stats
    process_inventory_undeduction
    OrderEvent.delay_post(@order, @user_id)
  ensure
    @order.transactions << @transaction if @transaction.present?
  end

  private

  def process_inventory_undeduction
    @order.line_items.each { |li| UndeductLineItemInventoryJob.perform_later(li.id) }
  end

  def process_stripe_refund
    raise Errors::ValidationError.new(:unsupported_payment_method, @order.payment_method) unless @order.payment_method == Order::CREDIT_CARD

    @transaction = @payment_service.refund
    raise Errors::ProcessingError.new(:refund_failed, @transaction.failure_data) if @transaction.failed?
  end

  def cancel_payment_intent
    raise Errors::ValidationError.new(:unsupported_payment_method, @order.payment_method) unless @order.payment_method == Order::CREDIT_CARD

    @transaction = @payment_service.cancel_payment_intent
    raise Errors::ProcessingError.new(:refund_failed, @transaction.failure_data) if @transaction.failed?
  end

  def record_stats
    Exchange.dogstatsd.increment 'order.refund'
    Exchange.dogstatsd.count('order.money_refunded', @order.buyer_total_cents)
  end
end

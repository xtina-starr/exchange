class OrderCancelationProcessor
  def initialize(order, user_id = nil)
    @order = order
    @user_id = user_id
    @payment_service = PaymentService.new(@order)
  end

  def queue_undeduct_inventory_jobs
    @order.line_items.each do |li|
      UndeductLineItemInventoryJob.perform_later(li.id)
    end
  end

  def notify
    OrderEvent.delay_post(@order, @user_id)
  end

  def refund_payment
    unless @order.payment_method == Order::CREDIT_CARD
      raise Errors::ValidationError.new(
              :unsupported_payment_method,
              @order.payment_method
            )
    end

    transaction = @payment_service.refund
    @order.transactions << transaction
    if transaction.failed?
      raise Errors::ProcessingError.new(
              :refund_failed,
              transaction.failure_data
            )
    end

    # Only credit commission exemption for refunds, cancelations never deducted from commission exemption total
    Gravity.refund_commission_exemption(
      partner_id: @order.seller_id,
      reference_id: @order.id,
      notes: 'refund'
    )
  end

  def cancel_payment
    unless @order.payment_method == Order::CREDIT_CARD
      raise Errors::ValidationError.new(
              :unsupported_payment_method,
              @order.payment_method
            )
    end

    transaction = @payment_service.cancel_payment_intent
    @order.transactions << transaction
    if transaction.failed?
      raise Errors::ProcessingError.new(
              :cancel_payment_failed,
              transaction.failure_data
            )
    end
  end
end

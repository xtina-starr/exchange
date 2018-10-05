class OrderCancellationService
  def initialize(order, by = nil)
    @order = order
    @by = by
    @transaction = nil
  end

  def seller_lapse!
    @order.seller_lapse! do
      refund
    end
    PostNotificationJob.perform_later(@order.id, Order::CANCELED)
  ensure
    @order.transactions << @transaction if @transaction.present?
  end

  def reject!
    @order.reject! do
      refund
    end
    PostNotificationJob.perform_later(@order.id, Order::CANCELED, @by)
  ensure
    @order.transactions << @transaction if @transaction.present?
  end

  def refund!
    @order.refund! do
      refund
    end
    PostNotificationJob.perform_later(@order.id, Order::REFUNDED, @by)
  ensure
    @order.transactions << @transaction if @transaction.present?
  end

  private

  def refund
    @transaction = PaymentService.refund_charge(@order.external_charge_id)
    raise Errors::ProcessingError.new(:refund_failed, @transaction.failure_data) if @transaction.failed?

    @order.line_items.each { |li| GravityService.undeduct_inventory(li) }
  end
end

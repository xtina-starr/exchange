class OrderRefundService
  def initialize(order, by = nil)
    @order = order
    @by = by
    @transaction = nil
  end

  def seller_lapse!
    @order.seller_lapse! do
      refund
    end
    PostNotificationJob.perform_later(@order.id, Order::SELLER_LAPSED)
  ensure
    @order.transactions << @transaction if @transaction.present?
  end

  def reject!
    @order.reject! do
      refund
    end
    PostNotificationJob.perform_later(@order.id, Order::REJECTED, @by)
  ensure
    @order.transactions << @transaction if @transaction.present?
  end

  private

  def refund
    @transaction = PaymentService.refund_charge(@order.external_charge_id)
    raise Errors::PaymentError, "Could not refund this order. #{@transaction}" if @transaction.failed?
    @order.line_items.each { |li| GravityService.undeduct_inventory(li) }
  end
end

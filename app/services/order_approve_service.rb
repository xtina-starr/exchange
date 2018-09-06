class OrderApproveService
  def initialize(order, by = nil)
    @order = order
    @by = by
  end

  def process!
    order.approve_prep!
    transaction = PaymentService.capture_charge(order.external_charge_id)
    order.transactions << transaction
    raise Errors::ProcessingError, "Failed holding the charge, #{transaction}" if transaction.failed?
    order.approve!
    post_process
    order
  end

  private

  def post_process
    @order.line_items.each { |li| RecordSalesTaxJob.perform_later(li.id) }
    PostNotificationJob.perform_later(@order.id, Order::APPROVED, by)
    OrderFollowUpJob.set(wait_until: @order.state_expires_at).perform_later(@order.id, @order.state)
  end
end
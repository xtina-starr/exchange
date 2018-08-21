module OrderService
  def self.set_payment!(order, credit_card_id:)
    raise Errors::OrderError, 'Cannot set payment info on non-pending orders' unless order.state == Order::PENDING
    Order.transaction do
      order.update!(credit_card_id: credit_card_id)
    end
    order
  end

  def self.set_shipping!(order, attributes)
    raise Errors::OrderError, 'Cannot set shipping info on non-pending orders' unless order.state == Order::PENDING

    Order.transaction do
      attrs = {
        shipping_total_cents: order.line_items.map { |li| ShippingService.calculate_shipping(li, attributes.slice(:shipping_country, :fulfillment_type)) }.sum,
        tax_total_cents: 100_00 # TODO: 🚨 replace this with real tax calculation 🚨
      }
      order.update!(
        attrs.merge(
          attributes.slice(
            :shipping_name,
            :shipping_address_line1,
            :shipping_address_line2,
            :shipping_city,
            :shipping_region,
            :shipping_country,
            :shipping_postal_code,
            :fulfillment_type
          )
        )
      )
    end
    order
  end

  def self.approve!(order, by: nil)
    order.approve! do
      charge = PaymentService.capture_charge(order.external_charge_id)
      transaction = {
        external_id: charge.id,
        source_id: charge.source,
        destination_id: charge.destination,
        amount_cents: charge.amount,
        failure_code: charge.failure_code,
        failure_message: charge.failure_message,
        transaction_type: charge.transaction_type,
        status: Transaction::SUCCESS
      }
      TransactionService.create!(order, transaction)
    end
    PostNotificationJob.perform_later(order.id, Order::APPROVED, by)
    ExpireOrderJob.set(wait_until: order.state_expires_at).perform_later(order.id, order.state)
    order
  rescue Errors::PaymentError => e
    TransactionService.create!(order, e.body)
    Rails.logger.error("Could not approve order #{order.id}: #{e.message}")
    raise e
  end

  def self.fulfill_at_once!(order, fulfillment, by)
    Order.transaction do
      fulfillment = Fulfillment.create!(fulfillment.slice(:courier, :tracking_id, :estimated_delivery))
      order.line_items.each do |li|
        li.line_item_fulfillments.create!(fulfillment_id: fulfillment.id)
      end
      order.fulfill!
      PostNotificationJob.perform_later(order.id, Order::FULFILLED, by)
    end
    order
  end

  def self.reject!(order, by)
    order.reject! do
      refund(order)
    end
    PostNotificationJob.perform_later(order.id, Order::REJECTED, by)
    order
  rescue Errors::PaymentError => e
    TransactionService.create!(order, e.body)
    Rails.logger.error("Could not reject order #{order.id}: #{e.message}")
    raise e
  end

  def self.seller_lapse!(order)
    order.seller_lapse! do
      refund(order)
    end
    PostNotificationJob.perform_later(order.id, Order::SELLER_LAPSED)
    order
  end

  def self.abandon!(order)
    order.abandon!
  end

  def self.valid_currency_code?(currency_code)
    Order::SUPPORTED_CURRENCIES.include?(currency_code.downcase)
  end

  def self.refund(order)
    refund = PaymentService.refund_charge(order.external_charge_id)
    transaction = {
      external_id: refund.id,
      amount_cents: refund.amount,
      transaction_type: Transaction::REFUND,
      status: Transaction::SUCCESS
    }
    TransactionService.create!(order, transaction)
  end
end

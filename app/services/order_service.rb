module OrderService
  def self.set_payment!(order, credit_card_id:)
    raise Errors::OrderError, 'Cannot set payment info on non-pending orders' unless order.state == Order::PENDING
    Order.transaction do
      order.update!(credit_card_id: credit_card_id)
    end
    order
  end

  def self.set_shipping!(order, fulfillment_type:, shipping: {})
    raise Errors::OrderError, 'Cannot set shipping info on non-pending orders' unless order.state == Order::PENDING
    Order.transaction do
      shipping_total_cents = order.line_items.map { |li| ShippingService.calculate_shipping(li, shipping_country: shipping[:country], fulfillment_type: fulfillment_type) }.sum
      attrs = {
        shipping_total_cents: shipping_total_cents,
        tax_total_cents: SalesTaxService.calculate_total_sales_tax(order, fulfillment_type, shipping, shipping_total_cents)
      }
      order.update!(
        attrs.merge(
          fulfillment_type: fulfillment_type,
          shipping_name: shipping[:name],
          shipping_address_line1: shipping[:address_line1],
          shipping_address_line2: shipping[:address_line2],
          shipping_city: shipping[:city],
          shipping_region: shipping[:region],
          shipping_country: shipping[:country],
          shipping_postal_code: shipping[:postal_code]
        )
      )
    end
    order
  end

  def self.approve!(order, by: nil)
    transaction = order.approve! do
      PaymentService.capture_charge(order.external_charge_id)
    end
    order.transactions << transaction
    PostNotificationJob.perform_later(order.id, Order::APPROVED, by)
    OrderFollowUpJob.set(wait_until: order.state_expires_at).perform_later(order.id, order.state)
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
    transaction = order.reject! do
      refund(order)
    end
    order.transactions << transaction
    PostNotificationJob.perform_later(order.id, Order::REJECTED, by)
    order
  rescue Errors::PaymentError => e
    order.transactions << e.transaction
    Rails.logger.error("Could not reject order #{order.id}: #{e.message}")
    raise e
  end

  def self.seller_lapse!(order)
    transaction = order.seller_lapse! do
      refund(order)
    end
    order.transactions << transaction
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
    transaction = PaymentService.refund_charge(order.external_charge_id)
    order.line_items.each { |li| GravityService.undeduct_inventory(li) }
    transaction
  end
end

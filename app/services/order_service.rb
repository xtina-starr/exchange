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
    order.with_lock do
      order.approve!
      charge = PaymentService.capture_charge(order.external_charge_id)
      TransactionService.create_success!(order, charge)
      order.save!
      PostNotificationJob.perform_later(order.id, Order::APPROVED, by)
    end
    order
  rescue Errors::PaymentError => e
    TransactionService.create_failure!(order, e.body)
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
      order.save!
      PostNotificationJob.perform_later(order.id, Order::FULFILLED, by)
    end
    order
  end

  def self.reject!(order)
    Order.transaction do
      order.reject!
      refund = PaymentService.refund_charge(order.external_charge_id)
      TransactionService.create_success!(order, refund)
      order.save!
    rescue Errors::PaymentError => e
      TransactionService.create_failure!(order, e.body)
      Rails.logger.error("Could not reject order #{order.id}: #{e.message}")
    end
    order
  end

  def self.abandon!(order)
    Order.transaction do
      order.abandon!
      order.save!
    end
  end

  def self.valid_currency_code?(currency_code)
    Order::SUPPORTED_CURRENCIES.include?(currency_code.downcase)
  end
end

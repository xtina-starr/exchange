module OrderService
  def self.set_payment!(order, credit_card_id:)
    raise Errors::OrderError, 'Cannot set payment info on non-pending orders' unless order.state == Order::PENDING
    Order.transaction do
      order.update!(credit_card_id: credit_card_id)
    end
    order
  end

  def self.set_shipping!(order, fulfillment_type:, phone_number:, shipping: {})
    raise Errors::OrderError, 'Cannot set shipping info on non-pending orders' unless order.state == Order::PENDING
    Order.transaction do
      shipping_total_cents = order.line_items.map { |li| ShippingService.calculate_shipping(li, shipping_country: shipping[:country], fulfillment_type: fulfillment_type) }.sum
      attrs = {
        shipping_total_cents: shipping_total_cents,
        tax_total_cents: order.line_items.map do |li|
          sales_tax = SalesTaxService.new(li, fulfillment_type, shipping, shipping_total_cents).sales_tax
          li.update!(sales_tax_cents: sales_tax)
          sales_tax
        end.sum
      }
      order.update!(
        attrs.merge(
          fulfillment_type: fulfillment_type,
          buyer_phone_number: phone_number,
          shipping_name: shipping[:name],
          shipping_address_line1: shipping[:address_line1],
          shipping_address_line2: shipping[:address_line2],
          shipping_city: shipping[:city],
          shipping_region: shipping[:region],
          shipping_country: shipping[:country],
          shipping_postal_code: shipping[:postal_code]
        )
      )
      update_totals!(order)
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
    order.line_items.each { |li| RecordSalesTaxJob.perform_later(li.id) }
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
    order.line_items.each { |li| GravityService.undeduct_inventory(li) }
  end

  def self.update_totals!(order)
    raise Errors::OrderError, 'Missing price info on line items' if order.line_items.any? { |li| li.price_cents.nil? }
    order.items_total_cents = order.line_items.pluck(:price_cents, :quantity).map { |a| a.inject(:*) }.sum
    order.buyer_total_cents = order.items_total_cents + order.shipping_total_cents.to_i + order.tax_total_cents.to_i
    order.seller_total_cents = order.buyer_total_cents - order.commission_fee_cents.to_i - order.transaction_fee_cents.to_i
    order.save!
  end
end

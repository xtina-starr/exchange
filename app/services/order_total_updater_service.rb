class OrderTotalUpdaterService
  def self.update_totals!(order, commission_rate = nil)
    raise Errors::OrderError, 'Missing price info on line items' if order.line_items.any? { |li| li.price_cents.nil? }
    order.items_total_cents = order.line_items.map(&:total_amount_cents).sum
    order.buyer_total_cents = order.items_total_cents + order.shipping_total_cents.to_i + order.tax_total_cents.to_i
    order.commission_fee_cents = calculate_commission_fee(order, commission_rate) if commission_rate.present?
    order.transaction_fee_cents = calculate_transaction_fee(order)
    order.seller_total_cents = order.buyer_total_cents - order.commission_fee_cents.to_i - order.transaction_fee_cents.to_i
    order.save!
  end

  def self.calculate_commission_fee(order, commission_rate)
    order.items_total_cents * commission_rate
  end

  def self.calculate_transaction_fee(order)
    return 0 unless order.buyer_total_cents.positive?
    # This is based on Stripe US fee, it will be different for other countries
    # https://stripe.com/us/pricing
    (Money.new(order.buyer_total_cents * 2.9 / 100, 'USD') + Money.new(30, 'USD')).cents
  end
end

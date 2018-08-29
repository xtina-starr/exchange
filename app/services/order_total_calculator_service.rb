module OrderTotalCalculatorService
  def self.calculate_items_total_cents(order)
    order.line_items.sum(:price_cents)
  end

  # Total amount (in cents) that the buyer will pay
  def self.calculate_buyer_total_cents(order)
    order.items_total_cents + order.shipping_total_cents.to_i + order.tax_total_cents.to_i
  end

  # Total amount (in cents) that the seller will receive
  def self.calculate_seller_total_cents(order)
    order.buyer_total_cents - order.commission_fee_cents.to_i - order.transaction_fee_cents.to_i
  end
end

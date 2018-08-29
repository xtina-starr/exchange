module OrderTotalCalculatorService
  def self.items_total_cents(line_items)
    raise Errors::OrderError, 'Missing price info on line items' if line_items.where(price_cents: nil).exists?
    line_items.pluck(:price_cents, :quantity).map { |a| a.inject(:*) }.sum
  end

  # Total amount (in cents) that the buyer will pay
  def self.buyer_total_cents(order)
    order.items_total_cents + order.shipping_total_cents.to_i + order.tax_total_cents.to_i
  end

  # Total amount (in cents) that the seller will receive
  def self.seller_total_cents(order)
    order.buyer_total_cents - order.commission_fee_cents.to_i - order.transaction_fee_cents.to_i
  end
end

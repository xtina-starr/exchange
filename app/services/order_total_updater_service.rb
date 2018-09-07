class OrderTotalUpdaterService
  def initialize(order, commission_rate = nil)
    @order = order
    raise 'Commission rate should be a value between 0 and 1' if commission_rate.present? && (commission_rate > 1 || commission_rate.negative?)
    @commission_rate = commission_rate
  end

  def update_totals!
    raise Errors::OrderError, 'Missing price info on line items' if @order.line_items.any? { |li| li.price_cents.nil? }
    @order.items_total_cents = @order.line_items.map(&:total_amount_cents).sum
    @order.buyer_total_cents = @order.items_total_cents + @order.shipping_total_cents.to_i + @order.tax_total_cents.to_i
    @order.commission_fee_cents = calculate_commission_fee if @commission_rate.present?
    @order.transaction_fee_cents = calculate_transaction_fee
    @order.seller_total_cents = @order.buyer_total_cents - @order.commission_fee_cents.to_i - @order.transaction_fee_cents.to_i - calculate_remittable_sales_tax
    @order.save!
  end

  private

  def calculate_remittable_sales_tax
    @order.line_items.select(&:should_remit_sales_tax).sum(&:sales_tax_cents)
  end

  def calculate_commission_fee
    @order.items_total_cents * @commission_rate
  end

  def calculate_transaction_fee
    return 0 unless @order.buyer_total_cents.positive?
    # This is based on Stripe US fee, it will be different for other countries
    # https://stripe.com/us/pricing
    (Money.new(@order.buyer_total_cents * 2.9 / 100, 'USD') + Money.new(30, 'USD')).cents
  end
end

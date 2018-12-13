class OrderCalculator
  def initialize(line_items:, shipping_total_cents:, tax_total_cents:, commission_rate: nil)
    @line_items = line_items
    @shipping_total_cents = shipping_total_cents
    @tax_total_cents = tax_total_cents
    @commission_rate = commission_rate
    raise Errors::ValidationError, :invalid_commission_rate if commission_rate.present? && (commission_rate > 1 || commission_rate.negative?)
  end

  def items_total_cents
    @items_total_cents ||= @line_items.map(&:total_amount_cents).sum
  end

  def buyer_total_cents
    @buyer_total_cents ||= items_total_cents + @shipping_total_cents.to_i + @tax_total_cents.to_i if items_total_cents
  end

  def commission_fee_cents
    @commission_fee_cents ||= calculate_commission_cents if @commission_rate
  end

  def transaction_fee_cents
    0 unless buyer_total_cents.positive?

    # This is based on Stripe US fee, it will be different for other countries https://stripe.com/us/pricing
    @transaction_fee_cents ||= buyer_total_cents.positive? ? (Money.new(buyer_total_cents * 2.9 / 100, 'USD') + Money.new(30, 'USD')).cents : 0
  end

  def seller_total_cents
    return unless buyer_total_cents && commission_fee_cents && transaction_fee_cents

    @seller_total_cents ||= buyer_total_cents - commission_fee_cents - transaction_fee_cents - calculate_remittable_sales_tax
  end

  def list_price_available?
    @line_items.all? { |li| li.list_price_cents.present? }
  end

  private

  def calculate_commission_cents
    @line_items.map(&:commission_fee_cents).sum
  end

  def calculate_remittable_sales_tax
    @line_items.select(&:should_remit_sales_tax).sum(&:sales_tax_cents)
  end
end

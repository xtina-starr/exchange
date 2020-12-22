class OfferOrderTotals
  # Given an offer, it calculate totals on the order
  attr_reader :offer

  delegate :tax_total_cents, to: :offer
  delegate :should_remit_sales_tax, to: :offer
  delegate :commission_rate, to: :order
  delegate :shipping_total_cents, to: :offer
  delegate :tax_total_cents, to: :offer
  delegate :buyer_total_cents, to: :offer

  def initialize(offer, commission_exemption_amount_cents: nil)
    @offer = offer
    @order = offer.order
    @commission_exemption_amount_cents = commission_exemption_amount_cents
  end

  def items_total_cents
    offer.amount_cents
  end

  def commission_rate
    @commission_rate ||= @order.partner[:effective_commission_rate]
  end

  def commission_fee_cents
    @commission_fee_cents ||= calculate_commission_fee_cents
  end

  def transaction_fee_cents
    @transaction_fee_cents ||= TransactionFeeCalculator.calculate(buyer_total_cents, @order.currency_code)
  end

  def seller_total_cents
    return unless buyer_total_cents && commission_fee_cents && transaction_fee_cents

    @seller_total_cents ||= buyer_total_cents - commission_fee_cents - transaction_fee_cents - calculate_remittable_sales_tax
  end

  private

  def calculate_remittable_sales_tax
    @offer.should_remit_sales_tax? ? @offer.tax_total_cents : 0
  end

  def calculate_commission_fee_cents
    if @commission_exemption_amount_cents.nil? || !@commission_exemption_amount_cents.positive?
      commission_rate * offer.amount_cents
    else
      commission_rate * (offer.amount_cents - @commission_exemption_amount_cents)
    end
  end
end

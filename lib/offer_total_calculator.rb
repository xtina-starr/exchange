class OfferTotalCalculator
  attr_reader :offer
  delegate :tax_total_cents, to: :offer
  delegate :should_remit_sales_tax, to: :offer
  delegate :commission_rate, to: :order_helper
  delegate :shipping_total_cents, to: :offer
  delegate :tax_total_cents, to: :offer
  delegate :buyer_total_cents, to: :offer
  delegate :items_total_cents, to: :offer

  def initialize(offer)
    @offer = offer
    @order = offer.order
  end

  def items_total_cents
    offer.amount_cents
  end

  def commission_fee_cents
    @commission_fee_cents ||= commission_rate * offer.amount_cents
  end

  def transaction_fee_cents
    @transaction_fee_cents ||= TransactionFeeCalculator.calculate(offer.buyer_total_cents)
  end

  def seller_total_cents
    offer.buyer_total_cents - transaction_fee_cents - commission_fee_cents
  end

  private

  def order_helper
    @order_helper ||= OrderHelper.new(@order)
  end
end

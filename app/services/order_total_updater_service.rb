class OrderTotalUpdaterService
  def initialize(order, commission_rate = nil)
    @order = order
    raise Errors::ValidationError, :invalid_commission_rate if commission_rate.present? && (commission_rate > 1 || commission_rate.negative?)

    @commission_rate = commission_rate
  end

  def update_totals!
    raise Errors::ValidationError.new('Missing price info on line items', 'd2e1cc') if @order.line_items.any? { |li| li.price_cents.nil? }

    @order.with_lock do
      @order.items_total_cents = @order.line_items.map(&:total_amount_cents).sum
      @order.offer_total_cents = @order.last_offer&.amount_cents if @order.mode == Order::OFFER
      if @order.current_total_cents.present?
        @order.buyer_total_cents = @order.current_total_cents + @order.shipping_total_cents.to_i + @order.tax_total_cents.to_i
        if @commission_rate.present?
          @order.commission_rate = @commission_rate
          @order.commission_fee_cents = calculate_commission_cents
        end
        @order.transaction_fee_cents = calculate_transaction_fee
        @order.seller_total_cents = @order.buyer_total_cents - @order.commission_fee_cents.to_i - @order.transaction_fee_cents.to_i - calculate_remittable_sales_tax
      end
      @order.save!
    end
  end

  private

  def calculate_commission_cents
    if @order.mode == Order::OFFER
      @order.offer_total_cents * @commission_rate
    else
      set_commission_on_line_items
      @order.line_items.map(&:commission_fee_cents).sum
    end
  end

  def set_commission_on_line_items
    @order.line_items.each do |li|
      li.update!(commission_fee_cents: li.total_amount_cents * @commission_rate)
    end
  end

  def calculate_remittable_sales_tax
    @order.line_items.select(&:should_remit_sales_tax).sum(&:sales_tax_cents)
  end

  def calculate_transaction_fee
    return 0 unless @order.buyer_total_cents.positive?

    # This is based on Stripe US fee, it will be different for other countries
    # https://stripe.com/us/pricing
    (Money.new(@order.buyer_total_cents * 2.9 / 100, 'USD') + Money.new(30, 'USD')).cents
  end
end

class OrderTotalUpdaterService
  def initialize(order, commission_rate = nil)
    @order = order
    raise Errors::ValidationError, :invalid_commission_rate if commission_rate.present? && (commission_rate > 1 || commission_rate.negative?)

    @commission_rate = commission_rate
  end

  def update_totals!
    return unless can_calculate?

    @order.with_lock do
      @order.items_total_cents = @order.line_items.map(&:total_list_price_cents).sum
      if @order.items_total_cents.present?
        @order.buyer_total_cents = @order.items_total_cents + @order.shipping_total_cents.to_i + @order.tax_total_cents.to_i
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

  def can_calculate?
    return unless @order.mode == Order::BUY

    @order.line_items.present? && @order.line_items.all? { |li| li.list_price_cents.present? }
  end

  def calculate_commission_cents
    set_commission_on_line_items
    @order.line_items.map(&:commission_fee_cents).sum
  end

  def set_commission_on_line_items
    @order.line_items.each do |li|
      li.update!(commission_fee_cents: li.total_list_price_cents * @commission_rate)
    end
  end

  def calculate_remittable_sales_tax
    @order.line_items.select(&:should_remit_sales_tax).sum(&:sales_tax_cents)
  end

  def calculate_transaction_fee
    TransactionFeeCalculator.calculate(@order.buyer_total_cents)
  end
end

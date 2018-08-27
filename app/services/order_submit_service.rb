class OrderSubmitService
  def self.call!(order, by: nil)
    new(order, by).process!
  end

  attr_accessor :order, :credit_card, :merchant_account, :partner
  def initialize(order, by)
    @order = order
    @by = by
    @credit_card = nil
    @merchant_account = nil
    @partner = nil
  end

  def process!
    raise Errors::OrderError, "Missing info for submitting order(#{@order.id})" unless can_submit?
    # verify price change?
    pre_process!
    deducted_inventory = []
    @order.submit! do
      # Try holding artwork and deduct inventory
      @order.line_items.each do |li|
        GravityService.deduct_inventory(li)
        deducted_inventory << li
      end
      charge = PaymentService.authorize_charge(construct_charge_params)
      transaction = construct_transaction_success(charge)
      TransactionService.create!(@order, transaction)
      @order.update!(external_charge_id: charge.id, commission_fee_cents: calculate_commission_fee, transaction_fee_cents: calculate_transaction_fee)
    end
    post_process!
    @order
  rescue Errors::InventoryError => e
    # deduct failed for one of the line items, undeduct all already deducted inventory
    deducted_inventory.each { |li| GravityService.undeduct_inventory(li) }
    raise e
  rescue Errors::PaymentError => e
    # there was an issue in processing charge, undeduct all already deducted inventory
    deducted_inventory.each { |li| GravityService.undeduct_inventory(li) }
    TransactionService.create!(@order, e.body)
    Rails.logger.error("Could not submit order #{@order.id}: #{e.message}")
    raise e
  end

  private

  def pre_process!
    @credit_card = GravityService.get_credit_card(@order.credit_card_id)
    assert_credit_card!
    @partner = GravityService.fetch_partner(@order.partner_id)
    @merchant_account = GravityService.get_merchant_account(@order.partner_id)
  end

  def post_process!
    PostNotificationJob.perform_later(@order.id, Order::SUBMITTED, @by)
    OrderFollowUpJob.set(wait_until: @order.state_expires_at).perform_later(@order.id, @order.state)
  end

  def construct_transaction_success(charge)
    {
      external_id: charge.id,
      source_id: charge.source,
      destination_id: charge.destination,
      amount_cents: charge.amount,
      failure_code: charge.failure_code,
      failure_message: charge.failure_message,
      transaction_type: charge.transaction_type,
      status: Transaction::SUCCESS
    }
  end

  def construct_charge_params
    {
      source_id: @credit_card[:external_id],
      customer_id: @credit_card[:customer_account][:external_id],
      destination_id: @merchant_account[:external_id],
      amount: @order.buyer_total_cents,
      currency_code: @order.currency_code
    }
  end

  def assert_credit_card!
    raise Errors::OrderError, 'Credit card does not have external id' if @credit_card[:external_id].blank?
    raise Errors::OrderError, 'Credit card does not have customer' if @credit_card.dig(:customer_account, :external_id).blank?
    raise Errors::OrderError, 'Credit card is deactivated' unless @credit_card[:deactivated_at].nil?
  end

  def can_submit?
    @order.shipping_info? && @order.payment_info?
  end

  def calculate_commission_fee
    @order.items_total_cents * @partner[:effective_commission_rate]
  end

  def calculate_transaction_fee
    # This is based on Stripe US fee, it will be different for other countries
    (Money.new(@order.buyer_total_cents * 2.9 / 100, 'USD') + Money.new(30, 'USD')).cents
  end
end

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
    @transaction = nil
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
      @transaction = PaymentService.authorize_charge(construct_charge_params)
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
    e.transaction.update! order: @order if e.transaction.present?
    Rails.logger.error("Could not submit order #{@order.id}: #{e.message}")
    raise e
  end

  private

  def pre_process!
    @order.line_items.map do |li|
      artwork = GravityService.get_artwork(li.artwork_id)
      raise Errors::OrderError, 'Artwork version out of date' if artwork[:current_version_id] != li.artwork_version_id
    end
    @credit_card = GravityService.get_credit_card(@order.credit_card_id)
    assert_credit_card!
    @partner = GravityService.fetch_partner(@order.seller_id)
    @merchant_account = GravityService.get_merchant_account(@order.seller_id)
    OrderTotalUpdaterService.new(@order, @partner[:effective_commission_rate]).update_totals!
  end

  def post_process!
    @order.update!(external_charge_id: @transaction.external_id)
    @order.transactions << @transaction
    PostNotificationJob.perform_later(@order.id, Order::SUBMITTED, @by)
    OrderFollowUpJob.set(wait_until: @order.state_expires_at).perform_later(@order.id, @order.state)
  end

  def construct_charge_params
    {
      credit_card: @credit_card,
      buyer_amount: @order.buyer_total_cents,
      merchant_account: @merchant_account,
      seller_amount: @order.seller_total_cents,
      currency_code: @order.currency_code,
      metadata: charge_metadata,
      description: charge_description
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

  def charge_description
    "#{(@partner[:name] || '').parameterize[0...12].upcase} via Artsy"
  end

  def charge_metadata
    {
      exchange_order_id: @order.id,
      buyer_id: @order.buyer_id,
      buyer_type: @order.buyer_type,
      seller_id: @order.seller_id,
      seller_type: @order.seller_type,
      type: 'bn-mo'
    }
  end
end

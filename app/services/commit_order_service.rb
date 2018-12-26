class CommitOrderService
  attr_accessor :order

  COMMITTABLE_ACTIONS = %i[approve submit].freeze

  def initialize(order, action, user_id)
    @order = order
    @action = action
    @user_id = user_id
    @transaction = nil
    @deducted_inventory = []
    @order_helper = OrderHelper.new(@order)
  end

  def process!
    pre_process!
    commit_order!
    post_process!
    @order
  rescue Errors::ValidationError, Errors::ProcessingError => e
    undeduct_inventory
    raise e
  ensure
    handle_transaction
  end

  private

  def handle_transaction
    return if @transaction.blank?

    @order.transactions << @transaction
    notify_failed_charge if @transaction.failed?
  end

  def commit_order!
    @order.send("#{@action}!") do
      deduct_inventory
      process_payment
    end
  end

  def undeduct_inventory
    @deducted_inventory.each { |li| Gravity.undeduct_inventory(li) }
    @deducted_inventory = []
  end

  def deduct_inventory
    # Try holding artwork and deduct inventory
    @order.line_items.each do |li|
      Gravity.deduct_inventory(li)
      @deducted_inventory << li
    end
  end

  def process_payment
    raise NotImplementedError
  end

  def pre_process!
    raise Errors::ValidationError, :uncommittable_action unless COMMITTABLE_ACTIONS.include? @action
    raise Errors::ValidationError, :missing_required_info unless @order.can_commit?

    OrderValidator.validate_credit_card!(@order_helper.credit_card)
    OrderValidator.validate_commission_rate!(@order_helper.partner)

    OrderTotalUpdaterService.new(order, @order_helper.partner[:effective_commission_rate]).update_totals!
  end

  def post_process!
    @order.update!(external_charge_id: @transaction.external_id)
    Exchange.dogstatsd.increment "order.#{@action}"
  end

  def notify_failed_charge
    PostTransactionNotificationJob.perform_later(@transaction.id, TransactionEvent::CREATED, @user_id)
  end

  def construct_charge_params
    {
      credit_card: @order_helper.credit_card,
      buyer_amount: @order.buyer_total_cents,
      merchant_account: @order_helper.merchant_account,
      seller_amount: @order.seller_total_cents,
      currency_code: @order.currency_code,
      metadata: charge_metadata,
      description: charge_description
    }
  end

  def charge_description
    partner_name = (@order_helper.partner[:name] || '').parameterize[0...12].upcase
    "#{partner_name} via Artsy"
  end

  def charge_metadata
    {
      exchange_order_id: @order.id,
      buyer_id: @order.buyer_id,
      buyer_type: @order.buyer_type,
      seller_id: @order.seller_id,
      seller_type: @order.seller_type,
      type: @order.auction_seller? ? 'auction-bn' : 'bn-mo'
    }
  end
end

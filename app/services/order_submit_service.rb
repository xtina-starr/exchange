module OrderSubmitService
  def self.submit!(order, by: nil)
    # verify price change?
    raise Errors::OrderError, "Missing info for submitting order(#{order.id})" unless can_submit?(order)

    merchant_account = get_merchant_account(order)
    credit_card = get_credit_card(order)

    charge_params = {
      source_id: credit_card[:external_id],
      customer_id: credit_card[:customer_account][:external_id],
      destination_id: merchant_account[:external_id],
      amount: order.buyer_total_cents,
      currency_code: order.currency_code
    }

    Order.transaction do
      order.submit!
      charge = PaymentService.authorize_charge(charge_params)
      order.external_charge_id = charge[:id]
      TransactionService.create_success!(order, charge)
      order.commission_fee_cents = calculate_commission(order)
      order.save!
      PostNotificationJob.perform_later(order.id, Order::SUBMITTED, by)
    end
    order
  rescue Errors::PaymentError => e
    TransactionService.create_failure!(order, e.body)
    Rails.logger.error("Could not submit order #{order.id}: #{e.message}")
    raise e
  end

  def self.get_merchant_account(order)
    merchant_account = Adapters::GravityV1.request("/merchant_accounts?partner_id=#{order.partner_id}").first
    raise Errors::OrderError, 'Partner does not have merchant account' if merchant_account.nil?
    merchant_account
  rescue Adapters::GravityNotFoundError
    raise Errors::OrderError, 'Unable to find partner or merchant account'
  rescue Adapters::GravityError => e
    raise Errors::OrderError, e.message
  end

  def self.get_credit_card(order)
    credit_card = Adapters::GravityV1.request("/credit_card/#{order.credit_card_id}")
    validate_credit_card(credit_card)
    credit_card
  rescue Adapters::GravityNotFoundError
    raise Errors::OrderError, 'Credit card not found'
  rescue Adapters::GravityError => e
    raise Errors::OrderError, e.message
  end

  def self.validate_credit_card(credit_card)
    raise Errors::OrderError, 'Credit card does not have external id' if credit_card[:external_id].blank?
    raise Errors::OrderError, 'Credit card does not have customer id' if credit_card.dig(:customer_account, :external_id).blank?
    raise Errors::OrderError, 'Credit card is deactivated' unless credit_card[:deactivated_at].nil?
  end

  def self.can_submit?(order)
    order.shipping_info? && order.payment_info?
  end

  def self.calculate_commission(order)
    partner = GravityService.fetch_partner(order.partner_id)
    order.items_total_cents * partner[:effective_commission_rate]
  rescue Adapters::GravityError => e
    Rails.logger.error("Could not fetch partner for order #{order.id}: #{e.message}")
    raise Errors::OrderError, 'Cannot fetch partner'
  end
end

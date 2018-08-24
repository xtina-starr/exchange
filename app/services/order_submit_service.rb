module OrderSubmitService
  def self.submit!(order, by: nil)
    # verify price change?
    raise Errors::OrderError, "Missing info for submitting order(#{order.id})" unless can_submit?(order)

    merchant_account = GravityService.get_merchant_account(order.seller_id)
    credit_card = GravityService.get_credit_card(order.credit_card_id)
    validate_credit_card!(credit_card)
    charge_params = construct_charge_params(order, credit_card, merchant_account)

    order.submit! do
      charge = PaymentService.authorize_charge(charge_params)
      order.external_charge_id = charge.id
      transaction = construct_transaction_success(charge)
      TransactionService.create!(order, transaction)
      order.update!(commission_fee_cents: calculate_commission(order), transaction_fee_cents: calculate_transaction_fee(order))
    end
    PostNotificationJob.perform_later(order.id, Order::SUBMITTED, by)
    OrderFollowUpJob.set(wait_until: order.state_expires_at).perform_later(order.id, order.state)
    order
  rescue Errors::PaymentError => e
    TransactionService.create!(order, e.body)
    Rails.logger.error("Could not submit order #{order.id}: #{e.message}")
    raise e
  end

  def self.construct_transaction_success(charge)
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

  def self.construct_charge_params(order, credit_card, merchant_account)
    {
      source_id: credit_card[:external_id],
      customer_id: credit_card[:customer_account][:external_id],
      destination_id: merchant_account[:external_id],
      amount: order.buyer_total_cents,
      currency_code: order.currency_code
    }
  end

  def self.validate_credit_card!(credit_card)
    raise Errors::OrderError, 'Credit card does not have external id' if credit_card[:external_id].blank?
    raise Errors::OrderError, 'Credit card does not have customer id' if credit_card.dig(:customer_account, :external_id).blank?
    raise Errors::OrderError, 'Credit card is deactivated' unless credit_card[:deactivated_at].nil?
  end

  def self.can_submit?(order)
    order.shipping_info? && order.payment_info?
  end

  def self.calculate_commission(order)
    partner = GravityService.fetch_partner(order.seller_id)
    order.items_total_cents * partner[:effective_commission_rate]
  end

  def self.calculate_transaction_fee(order)
    # This is based on Stripe US fee, it will be different for other countries
    (Money.new(order.buyer_total_cents * 2.9 / 100, 'USD') + Money.new(30, 'USD')).cents
  end
end

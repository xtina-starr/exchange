module OrderSubmitService
  def self.submit!(order, by: nil)
    # verify price change?
    raise Errors::OrderError, "Missing info for submitting order(#{order.id})" unless can_submit?(order)

    merchant_account = get_merchant_account(order)
    raise Errors::OrderError, 'Partner does not have merchant account' if merchant_account.nil?

    credit_card = get_credit_card(order)
    raise Errors::OrderError, 'User does not have stored credit card' if credit_card.blank?

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
      PostNotificationJob.perform_later(order.id, Order::SUBMITTED, by)
      order.save!
    end
    order
  rescue Errors::PaymentError => e
    TransactionService.create_failure!(order, e.body)
    Rails.logger.error("Could not submit order #{order.id}: #{e.message}")
    raise e
  end

  def self.get_merchant_account(order)
    Adapters::GravityV1.request("/merchant_accounts?partner_id=#{order.partner_id}").first
  end

  def self.get_credit_card(order)
    Adapters::GravityV1.request("/credit_card/#{order.credit_card_id}")
  end

  def self.can_submit?(order)
    order.shipping_info? && order.payment_info?
  end
end

module PaymentService
  def self.authorize_charge(order, amount=order.items_total_cents)
    validate_payment_info(order)
    charge = Stripe::Charge.create(
      amount: amount,
      currency: 'usd',
      description: 'Artsy',
      source: order.credit_card_id,
      destination: order.destination_account_id,
      capture: false
    )
    TransactionService.create!(order, charge)
  end

  def self.validate_payment_info(order)
    raise Errors::PaymentError, 'Invalid credit card id' if order.credit_card_id.blank?
    raise Errors::PaymentError, 'Invalid destination account id' unless valid_destination_account?(order.partner_id, order.destination_account_id)
  end

  def self.valid_destination_account?(partner_id, destination_account_id)
    merchant_account_ids = Adapters::GravityV1.request("/merchant_accounts?partner_id=#{partner_id}")
    merchant_account_ids.pluck(:external_id).include? destination_account_id
  end
end
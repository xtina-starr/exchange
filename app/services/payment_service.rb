module PaymentService
  def self.authorize_charge(order, amount)
    raise Errors::PaymentError, 'Invalid destination account id' unless valid_destination_account?(order.partner_id, order.destination_account_id)
    begin
      charge = Stripe::Charge.create(
        amount: amount,
        currency: order.currency_code,
        description: 'Artsy',
        source: order.credit_card_id,
        destination: order.destination_account_id,
        capture: false
      )
      TransactionService.create!(order, charge)
    rescue Stripe::StripeError => e
      raise Errors::PaymentError, e.message
    end
  end

  def self.valid_destination_account?(partner_id, destination_account_id)
    merchant_account_ids = Adapters::GravityV1.request("/merchant_accounts?partner_id=#{partner_id}")
    merchant_account_ids.pluck(:external_id).include? destination_account_id
  end
end
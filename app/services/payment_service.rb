module PaymentService
  def self.authorize_charge(order, amount)
    raise Errors::PaymentError.new('Invalid destination account id', { failure_code: 'artsy_internal', failure_message: 'Invalid destination account id' }) unless valid_destination_account?(order)
    charge = Stripe::Charge.create(
      amount: amount,
      currency: order.currency_code,
      description: 'Artsy',
      source: order.credit_card_id,
      destination: order.destination_account_id,
      capture: false
    )
  rescue Stripe::StripeError => e
    puts e.json_body
    body = e.json_body[:error]
    failed_charge = {
      amount: amount,
      id: body[:charge],
      failure_code: body[:code],
      failure_message: body[:message],
    }
    raise Errors::PaymentError.new(e.message, failed_charge)
  end

  def self.valid_destination_account?(order)
    merchant_account_ids = Adapters::GravityV1.request("/merchant_accounts?partner_id=#{order.partner_id}")
    merchant_account_ids.pluck(:external_id).include? order.destination_account_id
  end
end
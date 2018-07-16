module PaymentService
  def self.authorize_charge(order, amount)
    merchant_account_id = get_merchant_account_id(order.partner_id)
    raise Errors::PaymentError.new('Partner does not have merchant account ID', failure_code: 'artsy_internal', failure_message: 'Partner does not have merchant account ID') if merchant_account_id.nil?
    Stripe::Charge.create(
      amount: amount,
      currency: order.currency_code,
      description: 'Artsy',
      source: order.credit_card_id,
      destination: merchant_account_id,
      capture: false
    )
  rescue Stripe::StripeError => e
    body = e.json_body[:error]
    failed_charge = {
      amount: amount,
      id: body[:charge],
      destination_id: merchant_account_id,
      failure_code: body[:code],
      failure_message: body[:message]
    }
    raise Errors::PaymentError.new(e.message, failed_charge)
  end

  def self.get_merchant_account_id(partner_id)
    merchant_account_id = Adapters::GravityV1.request("/merchant_accounts?partner_id=#{partner_id}").first
    merchant_account_id[:external_id] unless merchant_account_id.nil?
  end
end

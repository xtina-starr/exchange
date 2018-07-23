module PaymentService
  def self.authorize_charge(source_id:, customer_id:, destination_id:, amount:, currency_code:)
    charge = Stripe::Charge.create(
      amount: amount,
      currency: currency_code,
      description: 'Artsy',
      source: source_id,
      customer: customer_id,
      destination: destination_id,
      capture: false
    )
    charge.transaction_type = 'hold'
    return charge
  rescue Stripe::StripeError => e
    body = e.json_body[:error]
    failed_charge = {
      amount: amount,
      id: body[:charge],
      source_id: source_id,
      destination_id: destination_id,
      failure_code: body[:code],
      failure_message: body[:message],
      transaction_type: 'hold'
    }
    raise Errors::PaymentError.new(e.message, failed_charge)
  end

  def self.capture_charge(charge_id)
    charge = Stripe::Charge.retrieve(charge_id)
    charge.capture
    charge.transaction_type = 'capture'
    return charge
  rescue Stripe::StripeError => e
    body = e.json_body[:error]
    failed_charge = {
      id: charge_id,
      failure_code: body[:code],
      failure_message: body[:message],
      transaction_type: 'capture'
    }
    raise Errors::PaymentError.new(e.message, failed_charge)
  end
end

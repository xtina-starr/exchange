module PaymentService
  def self.authorize_charge(source_id:, customer_id:, destination_id:, amount:, currency_code:)
    Stripe::Charge.create(
      amount: amount,
      currency: currency_code,
      description: 'Artsy',
      source: source_id,
      customer: customer_id,
      destination: destination_id,
      capture: false
    )
  rescue Stripe::StripeError => e
    body = e.json_body[:error]
    failed_charge = {
      amount: amount,
      id: body[:charge],
      source_id: source_id,
      destination_id: destination_id,
      failure_code: body[:code],
      failure_message: body[:message]
    }
    raise Errors::PaymentError.new(e.message, failed_charge)
  end

  def self.capture_charge(charge_id)
    charge = Stripe::Charge.retrieve(charge_id)
    charge.capture
  rescue Stripe::StripeError => e
    body = e.json_body[:error]
    failed_charge = {
      amount: nil,
      id: nil,
      source_id: nil,
      destination_id: nil,
      failure_code: body[:code],
      failure_message: body[:message]
    }
    raise Errors::PaymentError.new(e.message, failed_charge)
  end
end

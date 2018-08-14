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
    charge.transaction_type = Transaction::HOLD
    charge
  rescue Stripe::StripeError => e
    body = e.json_body[:error]
    failed_charge = {
      amount: amount,
      external_id: body[:charge],
      source_id: source_id,
      destination_id: destination_id,
      failure_code: body[:code],
      failure_message: body[:message],
      transaction_type: Transaction::HOLD,
      status: Transaction::FAILURE
    }
    raise Errors::PaymentError.new(e.message, failed_charge)
  end

  def self.capture_charge(charge_id)
    charge = Stripe::Charge.retrieve(charge_id)
    charge.capture
    charge.transaction_type = Transaction::CAPTURE
    charge
  rescue Stripe::StripeError => e
    body = e.json_body[:error]
    failed_charge = {
      external_id: charge_id,
      failure_code: body[:code],
      failure_message: body[:message],
      transaction_type: Transaction::CAPTURE,
      status: Transaction::FAILURE
    }
    raise Errors::PaymentError.new(e.message, failed_charge)
  end

  def self.refund_charge(charge_id)
    refund = Stripe::Refund.create(charge: charge_id)
    refund.transaction_type = Transaction::REFUND
    refund
  rescue Stripe::StripeError => e
    body = e.json_body[:error]
    failed_refund = {
      external_id: charge_id,
      failure_code: body[:code],
      failure_message: body[:message],
      transaction_type: Transaction::REFUND,
      status: Transaction::FAILURE
    }
    raise Errors::PaymentError.new(e.message, failed_refund)
  end

end

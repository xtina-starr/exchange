module PaymentService
  def self.authorize_charge(credit_card:, buyer_amount:, seller_amount:, merchant_account:, currency_code:, description:, metadata: {})
    charge = Stripe::Charge.create(
      amount: buyer_amount,
      currency: currency_code,
      description: description,
      source: credit_card[:external_id],
      customer: credit_card[:customer_account][:external_id],
      destination: {
        account: merchant_account[:external_id],
        amount: seller_amount
      },
      metadata: metadata,
      capture: false
    )
    Transaction.new(external_id: charge.id, source_id: charge.source, destination_id: charge.destination, amount_cents: charge.amount, transaction_type: Transaction::HOLD, status: Transaction::SUCCESS)
  rescue Stripe::StripeError => e
    transaction = generate_transaction_from_exception(e, Transaction::HOLD, credit_card, merchant_account, buyer_amount)
    raise Errors::PaymentError.new(e.message, transaction)
  end

  def self.capture_charge(charge_id)
    charge = Stripe::Charge.retrieve(charge_id)
    charge.capture
    Transaction.new(external_id: charge.id, source_id: charge.source, destination_id: charge.destination, amount_cents: charge.amount, transaction_type: Transaction::CAPTURE, status: Transaction::SUCCESS)
  rescue Stripe::StripeError => e
    transaction = generate_transaction_from_exception(e, Transaction::CAPTURE, credit_card: credit_card, merchant_account: merchant_account, buyer_amount: buyer_amount)
    raise Errors::PaymentError.new(e.message, transaction)
  end

  def self.refund_charge(charge_id)
    refund = Stripe::Refund.create(charge: charge_id)
    Transaction.new(external_id: refund.id, transaction_type: Transaction::REFUND, status: Transaction::SUCCESS)
  rescue Stripe::StripeError => e
    transaction = generate_transaction_from_exception(e, Transaction::REFUND, charge_id: charge_id)
    raise Errors::PaymentError.new(e.message, transaction)
  end

  def self.generate_transaction_from_exception(e, type, credit_card:nil, merchant_account:nil, buyer_amount:nil, charge_id: nil)
    body = e.json_body[:error]
    transaction = Transaction.new(
      external_id: charge_id || body[:charge],
      source_id: (credit_card.present? ? credit_card[:external_id] : nil ),
      destination_id: (merchant_account.present? ? merchant_account[:external_id] : nil),
      amount_cents: buyer_amount,
      failure_code: body[:code],
      failure_message: body[:message],
      transaction_type: type,
      status: Transaction::FAILURE
    )
  end
end

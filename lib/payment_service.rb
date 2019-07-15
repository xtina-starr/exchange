module PaymentService
  def self.create_and_authorize_charge(charge_params)
    create_payment_intent(charge_params.merge(capture: false))
  end

  def self.create_and_capture_charge(charge_params)
    create_payment_intent(charge_params.merge(capture: true))
  end

  def self.capture_authorized_charge(charge_id)
    charge = Stripe::Charge.retrieve(charge_id)
    charge.capture
    Transaction.new(external_id: charge.id, source_id: charge.source.id, destination_id: charge.destination, amount_cents: charge.amount, transaction_type: Transaction::CAPTURE, status: Transaction::SUCCESS)
  rescue Stripe::StripeError => e
    generate_transaction_from_exception(e, Transaction::CAPTURE, charge_id: charge_id)
  end

  def self.refund_charge(charge_id)
    refund = Stripe::Refund.create(charge: charge_id, reverse_transfer: true)
    Transaction.new(external_id: refund.id, transaction_type: Transaction::REFUND, status: Transaction::SUCCESS)
  rescue Stripe::StripeError => e
    generate_transaction_from_exception(e, Transaction::REFUND, charge_id: charge_id)
  end


  def self.create_payment_intent(credit_card:, buyer_amount:, seller_amount:, merchant_account:, currency_code:, description:, metadata: {}, capture:)
    transaction_type = capture ? Transaction::CAPTURE : Transaction::HOLD
    payment_intent = Stripe::PaymentIntent.create(
      amount: buyer_amount,
      currency: currency_code,
      description: description,
      payment_method_types: ['card'],
      payment_method: credit_card[:external_id],
      customer: credit_card[:customer_account][:external_id],
      on_behalf_of: merchant_account[:external_id],
      transfer_data: {
        destination: merchant_account[:external_id],
        amount: seller_amount
      },
      metadata: metadata,
      capture: capture,
      confirm: true, # it creates payment intent and tries to confirm at the same time
      setup_future_usage: 'off-session'
    )
    case payment_intent.status # https://stripe.com/docs/payments/intents#intent-statuses
    when 'requires_action'
      Transaction.new(external_id: payment_intent.id, source_id: payment_intent.payment_method, destination_id: merchant_account[:external_id], amount_cents: payment_intent.amount, transaction_type: Transaction::PAYMENT_INTENT, status: Transaction::NEEDS_ACTION)
    when 'succeeded'
      Transaction.new(external_id: payment_intent.id, source_id: payment_intent.payment_method, destination_id: merchant_account[:external_id], amount_cents: payment_intent.amount, transaction_type: Transaction::PAYMENT_INTENT, status: Transaction::SUCCESS)
    end
  rescue Stripe::StripeError => e
    generate_transaction_from_exception(e, transaction_type, credit_card: credit_card, merchant_account: merchant_account, buyer_amount: buyer_amount)
  end


  def self.generate_transaction_from_exception(exc, type, credit_card: nil, merchant_account: nil, buyer_amount: nil, charge_id: nil)
    body = exc.json_body[:error]
    Transaction.new(
      external_id: charge_id || body[:charge],
      source_id: (credit_card.present? ? credit_card[:external_id] : nil),
      destination_id: (merchant_account.present? ? merchant_account[:external_id] : nil),
      amount_cents: buyer_amount,
      failure_code: body[:code],
      failure_message: body[:message],
      decline_code: body[:decline_code],
      transaction_type: type,
      status: Transaction::FAILURE
    )
  end
end

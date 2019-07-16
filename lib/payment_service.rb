module PaymentService
  def self.create_and_authorize_charge(charge_params)
    create_payment_intent(charge_params.merge(capture: false))
  end

  def self.create_and_capture_charge(charge_params)
    create_payment_intent(charge_params.merge(capture: true))
  end

  def self.capture_authorized_charge(external_id)
    if external_id.include?('ch_')
      # its a charge
      # @TODO: we can remove this code after 7 days of moving to payment intents
      charge = Stripe::Charge.retrieve(external_id)
      charge.capture
      Transaction.new(external_id: charge.id, source_id: charge.source.id, destination_id: charge.destination, amount_cents: charge.amount, transaction_type: Transaction::CAPTURE, status: Transaction::SUCCESS)
    else
      payment_intent = Stripe::PaymentIntent.retrieve(external_id)
      payment_intent.capture
      Transaction.new(external_id: payment_intent.id, source_id: payment_intent.payment_method, destination_id: payment_intent.transfer_data&.destination, amount_cents: payment_intent.amount, transaction_type: Transaction::CAPTURE, status: Transaction::SUCCESS)
    end
  rescue Stripe::StripeError => e
    generate_transaction_from_exception(e, Transaction::CAPTURE, external_id: external_id)
  end

  def self.refund_charge(external_id)
    if external_id.include?('ch_')
      # its a charge
      refund = Stripe::Refund.create(charge: external_id, reverse_transfer: true)
      Transaction.new(external_id: refund.id, transaction_type: Transaction::REFUND, status: Transaction::SUCCESS)
    else
      # we need to refund using payment_intent
      payment_intent = Stripe::PaymentIntent.retrieve(external_id)
      refund = Stripe::Refund.create(charge: payment_intent.charge.id, reverse_transfer: true)
      Transaction.new(external_id: refund.id, transaction_type: Transaction::REFUND, status: Transaction::SUCCESS)
    end
  rescue Stripe::StripeError => e
    generate_transaction_from_exception(e, Transaction::REFUND, external_id: external_id)
  end


  def self.create_payment_intent(credit_card:, buyer_amount:, seller_amount:, merchant_account:, currency_code:, description:, metadata: {}, capture:)
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
      capture_method: capture ? 'automatic' : 'manual',
      confirm: true, # it creates payment intent and tries to confirm at the same time
      setup_future_usage: 'off-session',
      confirmation_method: 'manual'
    )
    case payment_intent.status # https://stripe.com/docs/payments/intents#intent-statuses
    when 'requires_action'
      Transaction.new(external_id: payment_intent.id, source_id: payment_intent.payment_method, destination_id: merchant_account[:external_id], amount_cents: payment_intent.amount, transaction_type: Transaction::PAYMENT_INTENT, status: Transaction::REQUIRES_ACTION)
    when 'requires_capture'
      Transaction.new(external_id: payment_intent.id, source_id: payment_intent.payment_method, destination_id: merchant_account[:external_id], amount_cents: payment_intent.amount, transaction_type: Transaction::PAYMENT_INTENT, status: Transaction::REQUIRES_CAPTURE)
    when 'succeeded'
      Transaction.new(external_id: payment_intent.id, source_id: payment_intent.payment_method, destination_id: merchant_account[:external_id], amount_cents: payment_intent.amount, transaction_type: Transaction::PAYMENT_INTENT, status: Transaction::SUCCESS)
    when 'requires_payment_method'
      # attempting confirm failed
      Transaction.new(external_id: payment_intent.id, source_id: payment_intent.payment_method, destination_id: merchant_account[:external_id], amount_cents: payment_intent.amount, transaction_type: Transaction::PAYMENT_INTENT, status: Transaction::FAILURE, 
        failure_code: payment_intent.last_payment_error.code,
        failure_message: payment_intent.last_payment_error.message,
        decline_code: payment_intent.last_payment_error.decline_code)
    end
  end


  def self.generate_transaction_from_exception(exc, type, credit_card: nil, merchant_account: nil, buyer_amount: nil, external_id: nil)
    body = exc.json_body[:error]
    Transaction.new(
      external_id: external_id || body[:charge],
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

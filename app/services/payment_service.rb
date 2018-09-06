module PaymentService
  def self.authorize_charge(credit_card:, buyer_amount:, seller_amount:, merchant_account:, currency_code:, description:, metadata: {})
    build_transaction do
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
      Transaction.new(external_id: charge.id, source_id: charge.source.id, destination_id: charge.destination, amount_cents: charge.amount, transaction_type: Transaction::HOLD, status: Transaction::SUCCESS)
    end
  end

  def self.capture_charge(charge_id)
    build_transaction do
      charge = Stripe::Charge.retrieve(charge_id)
      charge.capture
      Transaction.new(external_id: charge.id, source_id: charge.source, destination_id: charge.destination, amount_cents: charge.amount, transaction_type: Transaction::CAPTURE, status: Transaction::SUCCESS)
    end
  end

  def self.refund_charge(charge_id)
    build_transaction do
      refund = Stripe::Refund.create(charge: charge_id)
      Transaction.new(external_id: refund.id, transaction_type: Transaction::REFUND, status: Transaction::SUCCESS)
    end
  end

  def self.build_transaction
    yield
  rescue Stripe::StripeError => e
    generate_transaction_from_exception(e, Transaction::REFUND, charge_id: charge_id)
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
      transaction_type: type,
      status: Transaction::FAILURE
    )
  end
end

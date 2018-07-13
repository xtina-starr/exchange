module TransactionService
  def self.create_failure!(order, error)
    order.transactions.create!(
      external_id: error[:id],
      source_id: order.credit_card_id,
      destination_id: order.merchant_account_id,
      amount_cents: error[:amount],
      failure_code: error[:failure_code],
      failure_message: error[:failure_message],
      status: 'failure'
    )
  end

  def self.create_success!(order, charge)
    order.transactions.create!(
      external_id: charge.id,
      source_id: order.credit_card_id,
      destination_id: order.merchant_account_id,
      amount_cents: charge.amount,
      failure_code: charge.failure_code,
      failure_message: charge.failure_message,
      status: 'success'
    )
  end
end

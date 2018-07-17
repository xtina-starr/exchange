module TransactionService
  def self.create_failure!(order, error)
    order.transactions.create!(
      external_id: error[:id],
      source_id: error[:source_id],
      destination_id: error[:destination_id],
      amount_cents: error[:amount],
      failure_code: error[:failure_code],
      failure_message: error[:failure_message],
      status: 'failure'
    )
  end

  def self.create_success!(order, charge)
    order.transactions.create!(
      external_id: charge.id,
      source_id: charge.source,
      destination_id: charge.destination,
      amount_cents: charge.amount,
      failure_code: charge.failure_code,
      failure_message: charge.failure_message,
      status: 'success'
    )
  end
end

module TransactionService
  def self.create!(order, charge)
    order.transactions.create!(
      charge_id: charge.id,
      source_id: charge.source.id,
      destination_id: charge.destination,
      amount_cents: charge.amount,
      failure_code: charge.failure_code,
      failure_message: charge.failure_message,
      status: charge.status 
    )
  end
end

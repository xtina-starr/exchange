module TransactionService
  def self.create!(order, transaction)
    order.transactions.create!(
      transaction.slice(
        :external_id,
        :source_id,
        :destination_id,
        :amount_cents,
        :failure_code,
        :failure_message,
        :transaction_type,
        :status
      )
    )
  end
end

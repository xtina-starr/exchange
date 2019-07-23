class PostTransactionNotificationJob < ApplicationJob
  queue_as :default

  def perform(transaction_id, user_id = nil)
    transaction = Transaction.find(transaction_id)
    TransactionEvent.post(transaction, user_id)
  end
end

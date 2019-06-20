# typed: false
class PostTransactionNotificationJob < ApplicationJob
  queue_as :default

  def perform(transaction_id, action, user_id = nil)
    transaction = Transaction.find(transaction_id)
    TransactionEvent.post(transaction, action, user_id)
  end
end

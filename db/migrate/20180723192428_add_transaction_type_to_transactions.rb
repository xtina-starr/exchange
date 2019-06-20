# typed: false
class AddTransactionTypeToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :transaction_type, :string
  end
end

class AddLastTransactionFailedToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :last_transaction_failed, :boolean
  end
end

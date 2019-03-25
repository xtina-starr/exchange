class AddDeclineCodeToTransactions < ActiveRecord::Migration[5.2]
  # decline_code is returned from stripe when a transaction is declined. It contains the reason for the card decline (i.e. insufficient_funds). 
  def change
    add_column :transactions, :decline_code, :string
  end
end

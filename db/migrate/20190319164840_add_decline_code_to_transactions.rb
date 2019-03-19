class AddDeclineCodeToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :decline_code, :string
  end
end

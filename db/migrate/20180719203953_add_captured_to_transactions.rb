class AddCapturedToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :captured, :boolean
  end
end

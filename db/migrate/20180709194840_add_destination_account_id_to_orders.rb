# typed: false
class AddDestinationAccountIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :destination_account_id, :string
  end
end

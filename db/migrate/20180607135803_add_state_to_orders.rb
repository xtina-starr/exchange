class AddStateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :state, :string, default: Order::PENDING
    add_index :orders, :state
  end
end

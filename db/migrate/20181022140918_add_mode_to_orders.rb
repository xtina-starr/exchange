class AddModeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :mode, :string, null: true
    add_index :orders, :mode
    Order.update_all(mode: Order::BUY)
    change_column :orders, :mode, :string, null: false
  end
end

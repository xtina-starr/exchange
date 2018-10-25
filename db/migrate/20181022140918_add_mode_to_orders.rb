class AddModeToOrders < ActiveRecord::Migration[5.2]
  def up
    add_column :orders, :mode, :string, null: true
    add_index :orders, :mode
    Order.update_all(mode: Order::BUY)
    change_column :orders, :mode, :string, null: false
  end

  def down
    remove_column :orders, :mode
  end
end

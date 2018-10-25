class AddModeToOrders < ActiveRecord::Migration[5.2]
  def up
    add_column :orders, :mode, :string, null: true
    Order.update_all(mode: Order::BUY)
    change_column :orders, :mode, :string, null: false
  end

  def down
    remove_column :orders, :mode
  end
end

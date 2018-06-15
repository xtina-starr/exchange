class AddStateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :state, :string, null: false
    add_index :orders, :state
  end
end

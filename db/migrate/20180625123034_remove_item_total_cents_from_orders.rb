# typed: false
class RemoveItemTotalCentsFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :item_total_cents
  end
end

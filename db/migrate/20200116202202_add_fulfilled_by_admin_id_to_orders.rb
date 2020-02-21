class AddFulfilledByAdminIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :fulfilled_by_admin_id, :string
  end
end

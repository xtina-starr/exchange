class AddExternalChargeIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :external_charge_id, :string
  end
end

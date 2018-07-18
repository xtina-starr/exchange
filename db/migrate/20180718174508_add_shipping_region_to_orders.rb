class AddShippingRegionToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipping_region, :string
  end
end

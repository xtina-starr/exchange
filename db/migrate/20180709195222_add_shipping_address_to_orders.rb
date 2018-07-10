class AddShippingAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders, bulk: true do
      t.column :shipping_address, :string
      t.column :shipping_city, :string
      t.column :shipping_country, :string
      t.column :shipping_postal_code, :string
      t.column :shipping_type, :string
    end
  end
end

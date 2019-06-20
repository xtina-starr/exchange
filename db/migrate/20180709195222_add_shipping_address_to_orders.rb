# typed: false
class AddShippingAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders, bulk: true do |t|
      t.column :shipping_address_line1, :string
      t.column :shipping_address_line2, :string
      t.column :shipping_city, :string
      t.column :shipping_country, :string
      t.column :shipping_postal_code, :string
      t.column :fulfillment_type, :string
    end
  end
end

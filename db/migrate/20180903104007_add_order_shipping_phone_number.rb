class AddOrderShippingPhoneNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipping_phone_number, :string
  end
end

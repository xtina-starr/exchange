class AddBuyerPhoneNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :buyer_phone_number, :string
  end
end

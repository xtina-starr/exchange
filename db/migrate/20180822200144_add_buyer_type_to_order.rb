# typed: false
class AddBuyerTypeToOrder < ActiveRecord::Migration[5.2]
  def change
    change_table :orders, bulk: true do |t|
      t.column :buyer_type, :string
      t.column :seller_type, :string
    end
    rename_column :orders, :user_id, :buyer_id
    rename_column :orders, :partner_id, :seller_id
  end
end

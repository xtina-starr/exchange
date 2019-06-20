# typed: false
class AddTotalCentsToOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders, bulk: true do |t|
      t.integer :items_total_cents
      t.integer :buyer_total_cents
      t.integer :seller_total_cents
    end
  end
end

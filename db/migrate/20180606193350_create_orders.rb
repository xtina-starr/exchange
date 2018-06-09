class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :code
      t.integer :item_total_cents
      t.integer :shipping_total_cents
      t.integer :tax_total_cents
      t.integer :transaction_fee_cents
      t.integer :comission_fee_cents
      t.string :currency_code, limit: 3
      t.string :user_id
      t.string :partner_id

      t.timestamps
    end
    add_index :orders, :code
    add_index :orders, :user_id
    add_index :orders, :partner_id
  end
end

# typed: false
class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :orders, id: :uuid do |t|
      t.string :code
      t.integer :item_total_cents
      t.integer :shipping_total_cents
      t.integer :tax_total_cents
      t.integer :transaction_fee_cents
      t.integer :commission_fee_cents
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

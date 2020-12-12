class SwitchToBiggerInt < ActiveRecord::Migration[5.2]
  def up
    change_table :orders, bulk: true do |t|
      t.change :shipping_total_cents, :bigint
      t.change :tax_total_cents, :bigint
      t.change :transaction_fee_cents, :bigint
      t.change :commission_fee_cents, :bigint
      t.change :items_total_cents, :bigint
      t.change :buyer_total_cents, :bigint
      t.change :seller_total_cents, :bigint
    end

    change_table :line_items, bulk: true do |t|
      t.change :list_price_cents, :bigint
      t.change :sales_tax_cents, :bigint
      t.change :commission_fee_cents, :bigint
      t.change :shipping_total_cents, :bigint
    end

    change_table :offers, bulk: true do |t|
      t.change :amount_cents, :bigint
      t.change :tax_total_cents, :bigint
      t.change :shipping_total_cents, :bigint
    end

    change_column :transactions, :amount_cents, :bigint
  end

  def down
    raise ActiveRecord::IrreversibleMigration,
          'This Migration is not easily reversible, you need to manually switch back to int'
  end
end

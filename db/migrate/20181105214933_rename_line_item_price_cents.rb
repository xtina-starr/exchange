class RenameLineItemPriceCents < ActiveRecord::Migration[5.2]
  def change
    rename_column :line_items, :price_cents, :list_price_cents
    remove_column :orders, :offer_total_cents
  end
end

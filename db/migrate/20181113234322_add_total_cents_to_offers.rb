class AddTotalCentsToOffers < ActiveRecord::Migration[5.2]
  def change
    change_table :offers do |t|
      t.integer :tax_total_cents
      t.integer :shipping_total_cents
      t.boolean :should_remit_sales_tax
    end
  end
end

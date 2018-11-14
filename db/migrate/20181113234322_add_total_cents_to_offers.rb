class AddTotalCentsToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :tax_total_cents, :integer
    add_column :offers, :shipping_total_cents, :integer
  end
end

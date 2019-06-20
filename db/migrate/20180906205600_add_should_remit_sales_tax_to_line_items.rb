# typed: false
class AddShouldRemitSalesTaxToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :should_remit_sales_tax, :boolean
  end
end

class AddSalesTaxCentsToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :sales_tax_cents, :integer
  end
end

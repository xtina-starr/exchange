class AddSalesTaxTransactionIdToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :sales_tax_transaction_id, :string
  end
end

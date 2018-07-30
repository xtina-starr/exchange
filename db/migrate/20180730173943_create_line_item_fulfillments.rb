class CreateLineItemFulfillments < ActiveRecord::Migration[5.2]
  def change
    create_table :line_item_fulfillments do |t|
      t.references :line_item, foreign_key: true
      t.references :fulfillment, foreign_key: true

      t.timestamps
    end
  end
end

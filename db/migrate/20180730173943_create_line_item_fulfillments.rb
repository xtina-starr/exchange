class CreateLineItemFulfillments < ActiveRecord::Migration[5.2]
  def change
    create_table :line_item_fulfillments, id: :uuid do |t|
      t.references :line_item, foreign_key: true, type: :uuid
      t.references :fulfillment, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

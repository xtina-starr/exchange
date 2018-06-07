class CreateOrderLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_line_items do |t|
      t.references :order, foreign_key: true
      t.string :artwork_id
      t.string :edition_set_id
      t.integer :price_cents

      t.timestamps
    end
  end
end

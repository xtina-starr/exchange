# typed: true
class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items, id: :uuid do |t|
      t.references :order, foreign_key: true, type: :uuid
      t.string :artwork_id
      t.string :edition_set_id
      t.integer :price_cents

      t.timestamps
    end
  end
end

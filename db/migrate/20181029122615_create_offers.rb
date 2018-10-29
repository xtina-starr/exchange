class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers, id: :uuid do |t|
      t.references :order, foreign_key: true, type: :uuid
      t.integer :amount_cents
      t.integer :offerer_id
      t.string :offerer_type
      t.string :state
      t.integer :offered_by
      t.integer :responded_by

      t.timestamps
    end
  end
end

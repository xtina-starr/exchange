class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers, id: :uuid do |t|
      t.references :order, foreign_key: true, type: :uuid
      t.integer :amount_cents
      t.string :offerer_id
      t.string :offerer_type
      t.string :state
      t.string :offered_by
      t.string :responded_by

      t.timestamps
    end
  end
end

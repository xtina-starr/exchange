# typed: true
class CreateFulfillments < ActiveRecord::Migration[5.2]
  def change
    create_table :fulfillments, id: :uuid do |t|
      t.string :courier
      t.string :tracking_id
      t.date :estimated_delivery
      t.string :notes

      t.timestamps
    end
  end
end

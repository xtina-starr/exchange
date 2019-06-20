# typed: true
class CreateStateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :state_histories, id: :uuid do |t|
      t.references :order, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

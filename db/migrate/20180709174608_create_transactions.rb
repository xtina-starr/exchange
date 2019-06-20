# typed: true
class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :order, foreign_key: true, type: :uuid
      t.string :external_id
      t.string :source_id
      t.string :destination_id
      t.integer :amount_cents
      t.string :failure_code
      t.string :failure_message
      t.string :status

      t.timestamps
    end
  end
end

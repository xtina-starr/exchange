class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :order, foreign_key: true
      t.string :charge_id
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

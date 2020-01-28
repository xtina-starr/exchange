class CreateFraudReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :fraud_reviews, id: :uuid do |t|
      t.references :order, foreign_key: true, type: :uuid
      t.string :admin_id, null: false
      t.boolean :considered_fraudulent
      t.string :context
      t.text :reason

      t.timestamps
    end
  end
end

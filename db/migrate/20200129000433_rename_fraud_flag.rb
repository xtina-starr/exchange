class RenameFraudFlag < ActiveRecord::Migration[6.0]
  def change
    rename_column :fraud_reviews, :considered_fraudulent, :flagged_as_fraud
  end
end

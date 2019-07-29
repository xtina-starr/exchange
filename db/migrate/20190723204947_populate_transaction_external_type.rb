class PopulateTransactionExternalType < ActiveRecord::Migration[5.2]
  def up
    Transaction.where('external_id LIKE :prefix', prefix: 'ch_%').update_all(external_type: Transaction::CHARGE)
    Transaction.where('external_id LIKE :prefix', prefix: 're_%').update_all(external_type: Transaction::REFUND)
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "This was a data migration, can't be easily rolled back"
  end
end

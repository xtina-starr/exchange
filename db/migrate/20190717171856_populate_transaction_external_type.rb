class PopulateTransactionExternalType < ActiveRecord::Migration[5.2]
  def up
    Transaction.update_all(external_type: Transaction::CHARGE)
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "This was a data migration, can't be easily rollback"
  end
end

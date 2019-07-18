class AddExternalTypeAndPayloadToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :external_type, :string
    add_column :transactions, :payload, :jsonb
  end
end

class RenamePaymentSourceDestinationAccountId < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :payment_source, :credit_card_id
    rename_column :orders, :destination_account_id, :merchant_account_id
  end
end

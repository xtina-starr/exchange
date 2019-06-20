# typed: false
class RemoveMerchantAccountIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :merchant_account_id
  end
end

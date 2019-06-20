# typed: false
class AddStateUpdatedExpiresAtToOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders, bulk: true do |t|
      t.column :state_updated_at, :timestamp
      t.column :state_expires_at, :timestamp
    end
  end
end

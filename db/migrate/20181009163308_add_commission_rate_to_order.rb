# typed: false
class AddCommissionRateToOrder < ActiveRecord::Migration[5.2]
  def change
    change_table :orders, bulk: true do |t|
      t.column :commission_rate, :float
    end
  end
end

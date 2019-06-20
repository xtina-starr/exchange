# typed: false
class AddCommissionCentsToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :commission_fee_cents, :integer
  end
end

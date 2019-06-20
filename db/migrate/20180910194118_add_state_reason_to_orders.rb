# typed: false
class AddStateReasonToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :state_reason, :string
    add_column :state_histories, :reason, :string
  end
end

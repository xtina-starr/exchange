# typed: false
class AddStateToStateHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :state_histories, :state, :string
  end
end

# typed: false
class AddAssistedToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :assisted, :boolean
  end
end

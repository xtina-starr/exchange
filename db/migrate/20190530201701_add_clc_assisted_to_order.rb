class AddClcAssistedToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :clc_assisted, :boolean
  end
end

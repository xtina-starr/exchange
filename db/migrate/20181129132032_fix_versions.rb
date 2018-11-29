class FixVersions < ActiveRecord::Migration[5.2]
  def change
    change_column :versions, :item_id, :string
  end
end

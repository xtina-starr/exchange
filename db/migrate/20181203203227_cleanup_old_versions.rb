# typed: true
class CleanupOldVersions < ActiveRecord::Migration[5.2]
  def up
    ActiveRecord::Base.connection.execute("DELETE FROM versions WHERE NOT item_id ~ E'^[[:xdigit:]]{8}-([[:xdigit:]]{4}-){3}[[:xdigit:]]{12}$'")
    change_column :versions, :item_id, 'uuid USING CAST(item_id AS uuid)'
  end

  def down
    change_column :versions, :item_id, :string
  end
end

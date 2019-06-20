# typed: false
class AddObjectChangesToOrderVersions < ActiveRecord::Migration[5.2]
  def change
    add_column :order_versions, :object_changes, :jsonb
  end
end

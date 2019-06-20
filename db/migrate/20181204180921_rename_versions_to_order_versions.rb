# typed: false
class RenameVersionsToOrderVersions < ActiveRecord::Migration[5.2]
  def change
    rename_table 'versions', 'order_versions'
  end
end

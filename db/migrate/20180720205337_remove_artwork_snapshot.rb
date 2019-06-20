# typed: false
class RemoveArtworkSnapshot < ActiveRecord::Migration[5.2]
  def change
    remove_column :line_items, :artwork_snapshot
  end
end

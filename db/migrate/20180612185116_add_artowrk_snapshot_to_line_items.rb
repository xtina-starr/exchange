# typed: false
class AddArtowrkSnapshotToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :artwork_snapshot, :jsonb
  end
end

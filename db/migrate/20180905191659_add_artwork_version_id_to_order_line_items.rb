class AddArtworkVersionIdToOrderLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :artwork_version_id, :string
  end
end

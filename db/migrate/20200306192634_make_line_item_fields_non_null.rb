class MakeLineItemFieldsNonNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:line_items, :artwork_id, false)
    change_column_null(:line_items, :artwork_version_id, false)
  end
end

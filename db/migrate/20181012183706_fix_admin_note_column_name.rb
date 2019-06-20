# typed: false
class FixAdminNoteColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :admin_notes, :type, :note_type
  end
end

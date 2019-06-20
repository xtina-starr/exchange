# typed: true
class CreateAdminNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_notes, id: :uuid do |t|
      t.references :order, foreign_key: true, type: :uuid
      t.string :admin_id, null: false
      t.string :type, null: false
      t.text :description

      t.timestamps
    end
  end
end

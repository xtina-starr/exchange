class CreateAdminNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_notes do |t|
      t.references :order, foreign_key: true
      t.string :admin_id, null: false
      t.string :type, null: false
      t.text :description

      t.timestamps
    end
  end
end

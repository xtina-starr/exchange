# typed: false
class AddNotesFieldToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :note, :text
  end
end

class AddNotesFieldToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :offer_note, :text
  end
end

class AddCreditCardIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :credit_card_id, :string
  end
end

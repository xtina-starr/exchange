# typed: false
class RenameOrdersCreditCardId < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :credit_card_id, :payment_source
  end
end

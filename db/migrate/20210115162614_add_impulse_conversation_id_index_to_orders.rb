class AddImpulseConversationIdIndexToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :impulse_conversation_id, :string
    add_index :orders, :impulse_conversation_id
  end
end

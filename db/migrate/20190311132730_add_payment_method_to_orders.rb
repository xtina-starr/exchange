# typed: false
class AddPaymentMethodToOrders < ActiveRecord::Migration[5.2]
  def up
    add_column :orders, :payment_method, :string, null: true
    Order.update_all(payment_method: Order::CREDIT_CARD)
    change_column :orders, :payment_method, :string, null: false
  end

  def down
    remove_column :orders, :payment_method
  end
end

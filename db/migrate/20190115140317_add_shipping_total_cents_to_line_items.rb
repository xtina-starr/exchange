class AddShippingTotalCentsToLineItems < ActiveRecord::Migration[5.2]
  def up
    add_column :line_items, :shipping_total_cents, :int
    Order.where.not(shipping_total_cents: nil).each do |o|
      o.line_items.update!(shipping_total_cents: o.shipping_total_cents)
    end
  end

  def down
    remove_column :line_items, :shipping_total_cents
  end
end

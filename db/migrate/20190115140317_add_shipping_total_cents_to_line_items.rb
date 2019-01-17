class AddShippingTotalCentsToLineItems < ActiveRecord::Migration[5.2]
  def up
    add_column :line_items, :shipping_total_cents, :int
    Order.where.not(shipping_total_cents: nil).each do |o|
      if o.line_items.count != 1
        puts "Not sure what to do, order has weird number of line item: #{o.id}: #{o.line_items.count}"
      else
        o.line_items.first.update!(shipping_total_cents: o.shipping_total_cents)
      end
    end
  end

  def down
    remove_column :line_items, :shipping_total_cents
  end
end

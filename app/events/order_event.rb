class OrderEvent < Events::BaseEvent
  TOPIC = 'commerce'.freeze

  def self.post(order, action, user_id)
    event = new(user: user_id, action: action, model: order)
    Artsy::EventService.post_event(topic: TOPIC, event: event)
  end

  def subject
    {
      id: @subject
    }
  end

  def properties
    {
      code: @object.code,
      created_at: @object.created_at,
      currency_code: @object.currency_code,
      items_total_cents: @object.items_total_cents,
      shipping_total_cents: @object.shipping_total_cents,
      tax_total_cents: @object.tax_total_cents,
      buyer_total_cents: @object.buyer_total_cents,
      commission_fee_cents: @object.commission_fee_cents,
      transaction_fee_cents: @object.transaction_fee_cents,
      seller_total_cents: @object.seller_total_cents,
      line_items: @object.line_items.map { |li| line_item_detail(li) },
      partner_id: @object.partner_id,
      shipping_name: @object.shipping_name,
      shipping_address_line1: @object.shipping_address_line1,
      shipping_address_line2: @object.shipping_address_line2,
      shipping_city: @object.shipping_city,
      shipping_country: @object.shipping_country,
      shipping_postal_code: @object.shipping_postal_code,
      shipping_region: @object.shipping_region,
      state: @object.state,
      updated_at: @object.updated_at
    }
  end

  def line_item_detail(line_item)
    {
      price_cents: line_item.price_cents,
      artwork_id: line_item.artwork_id,
      edition_set_id: line_item.edition_set_id,
      quantity: line_item.quantity
    }
  end
end

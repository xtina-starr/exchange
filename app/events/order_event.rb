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
      buyer_id: @object.buyer_id,
      buyer_phone_number: @object.buyer_phone_number,
      buyer_total_cents: @object.buyer_total_cents,
      buyer_type: @object.buyer_type,
      code: @object.code,
      commission_fee_cents: @object.commission_fee_cents,
      created_at: @object.created_at,
      currency_code: @object.currency_code,
      fulfillment_type: @object.fulfillment_type,
      items_total_cents: @object.items_total_cents,
      line_items: @object.line_items.map { |li| line_item_detail(li) },
      seller_id: @object.seller_id,
      seller_total_cents: @object.seller_total_cents,
      seller_type: @object.seller_type,
      shipping_address_line1: @object.shipping_address_line1,
      shipping_address_line2: @object.shipping_address_line2,
      shipping_city: @object.shipping_city,
      shipping_country: @object.shipping_country,
      shipping_name: @object.shipping_name,
      shipping_postal_code: @object.shipping_postal_code,
      shipping_region: @object.shipping_region,
      shipping_total_cents: @object.shipping_total_cents,
      state: @object.state,
      state_reason: @object.state_reason,
      state_expires_at: @object.state_expires_at,
      tax_total_cents: @object.tax_total_cents,
      transaction_fee_cents: @object.transaction_fee_cents,
      updated_at: @object.updated_at
    }
  end

  def line_item_detail(line_item)
    {
      price_cents: line_item.price_cents,
      artwork_id: line_item.artwork_id,
      edition_set_id: line_item.edition_set_id,
      quantity: line_item.quantity,
      commission_fee_cents: line_item.commission_fee_cents
    }
  end
end

module Events
  class OrderEvent < Events::BaseEvent
    TOPIC = 'BNMO'

    def self.post(order, action, user_id)
      event = OrderEvent.new(user: user, action: action, model: order)
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
        partner_id: @object.partner_id,
        currency_code: @object.currency_code,
        state: @object.state,
        items_total_cents: @object.items_total_cents,
        line_items: @object.line_items.map{ |li| line_item_detail(li) },
        updated_at: @object.updated_at,
        created_at: @object.created_at
      }
    end

    def line_item_details(li)
      {
        price_cents: li.price_cents,
        artwork_id: li.artwork_id,
        edition_set_id: li.edition_set_id,
        quantity: li.quantity
      }
    end
  end
end

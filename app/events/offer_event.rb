class OfferEvent < Events::BaseEvent
  TOPIC = 'commerce'.freeze
  ACTIONS = [
    CREATED = 'created'.freeze,
    SUBMITTED = 'submitted'.freeze
  ].freeze

  def self.post(offer, action, user_id)
    event = new(user: user_id, action: action, model: offer)
    Artsy::EventService.post_event(topic: TOPIC, event: event)
  end

  def subject
    {
      id: @subject
    }
  end

  def properties
    {
      amount_cents: @object.amount_cents,
      submitted_at: @object.submitted_at,
      from_participant: @object.from_participant,
      order: order
    }
  end

  private

  def order
    order = @object.order
    OrderEvent::PROPERTIES_ATTRS.map { |att| [att, order.send(att)] }.to_h.merge(line_items: line_items_details, last_offer: last_offer)
  end

  def line_items_details
    @object.order.line_items.map { |li| line_item_detail(li) }
  end

  def last_offer
    return unless @object.order.last_offer

    last_offer = @object.order.last_offer
    in_response_to = if last_offer.responds_to
                       {
                         id: last_offer.responds_to.id,
                         amount_cents: last_offer.responds_to.amount_cents,
                         created_at: last_offer.responds_to.created_at,
                         from_participant: last_offer.responds_to.from_participant
                       }
                     end
    {
      id: last_offer.id,
      amount_cents: last_offer.amount_cents,
      shipping_total_cents: last_offer.shipping_total_cents,
      tax_total_cents: last_offer.tax_total_cents,
      from_participant: last_offer.from_participant,
      creator_id: last_offer.creator_id,
      in_response_to: in_response_to
    }
  end

  def line_item_detail(line_item)
    {
      price_cents: line_item.list_price_cents,
      list_price_cents: line_item.list_price_cents,
      artwork_id: line_item.artwork_id,
      edition_set_id: line_item.edition_set_id,
      quantity: line_item.quantity,
      commission_fee_cents: line_item.commission_fee_cents
    }
  end
end

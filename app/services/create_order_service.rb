module CreateOrderService
  def self.with_artwork!(user_id:, artwork_id:, edition_set_id: nil, quantity:)
    artwork = GravityService.get_artwork(artwork_id)
    raise Errors::ValidationError.new(:unknown_artwork, artwork_id: artwork_id) if artwork.nil? || (edition_set_id && !find_edition_set(artwork, edition_set_id))
    raise Errors::ValidationError.new(:unpublished_artwork, artwork_id: artwork_id) unless artwork[:published]
    raise Errors::ValidationError.new(:not_acquireable, artwork_id: artwork_id) unless artwork[:acquireable]

    Order.transaction do
      order = Order.create!(
        buyer_id: user_id,
        buyer_type: Order::USER,
        seller_id: artwork[:partner][:_id],
        seller_type: Order::PARTNER,
        currency_code: artwork[:price_currency],
        state: Order::PENDING,
        state_updated_at: Time.now.utc,
        state_expires_at: Order::STATE_EXPIRATIONS[Order::PENDING].from_now
      )
      order.line_items.create!(
        artwork_id: artwork_id,
        artwork_version_id: artwork[:current_version_id],
        edition_set_id: edition_set_id,
        price_cents: artwork_price(artwork, edition_set_id: edition_set_id),
        quantity: quantity
      )
      OrderTotalUpdaterService.new(order).update_totals!
      OrderFollowUpJob.set(wait_until: order.state_expires_at).perform_later(order.id, order.state)
      order
    end
  rescue ActiveRecord::RecordInvalid => e
    raise Errors::ValidationError.new(:invalid_order, message: e.message)
  end

  def self.artwork_price(external_artwork, edition_set_id: nil)
    item =
      if edition_set_id
        edition_set = find_edition_set(external_artwork, edition_set_id)
        raise Errors::ValidationError.new(:unknown_edition_set, artwork_id: external_artwork[:id], edition_set_id: edition_set_id) unless edition_set
        edition_set
      else
        external_artwork
      end
    raise Errors::ValidationError, :missing_price unless item[:price_listed]&.positive?
    raise Errors::ValidationError, :missing_currency if item[:price_currency].blank?
    # TODO: 🚨 update gravity to expose amount in cents and remove this duplicate logic
    # https://github.com/artsy/gravity/blob/65e398e3648d61175e7a8f4403a2d379b5aa2107/app/models/util/for_sale.rb#L221
    UnitConverter.convert_dollars_to_cents(item[:price_listed])
  end

  def self.find_edition_set(external_artwork, edition_set_id)
    external_artwork[:edition_sets].find { |e| e[:id] == edition_set_id }
  end
end

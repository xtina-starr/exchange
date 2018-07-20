module CreateOrderWithArtworkService
  def self.process!(user_id:, artwork_id:, edition_set_id:, quantity:)
    artwork = get_artwork(artwork_id)
    raise Errors::OrderError, "Unknown artwork #{artwork_id}" if artwork.nil?

    Order.transaction do
      order = Order.create!(user_id: user_id, partner_id: artwork[:partner][:_id], currency_code: artwork[:price_currency], state: Order::PENDING)
      order.line_items.create!(
        artwork_id: artwork_id,
        edition_set_id: edition_set_id,
        price_cents: artwork_price(artwork, edition_set_id),
        quantity: quantity
      )
      order
    end
  end

  def self.get_artwork(artwork_id)
    Adapters::GravityV1.request("/artwork/#{artwork_id}")
  rescue Adapters::GravityError => e
    Rails.logger.warn("Could not fetch artwork #{artwork_id} from gravity: #{e.message}")
    nil
  end

  def self.artwork_price(external_artwork, edition_set_id)
    if edition_set_id
      edition_set = external_artwork[:edition_sets].find { |e| e[:id] == edition_set_id }
      edition_set[:price]
    else
      external_artwork[:price]
    end
  end
end

module CreateOrderService
  def self.with_artwork!(user_id:, artwork_id:, edition_set_id: nil, quantity:)
    artwork = get_artwork(artwork_id)
    raise Errors::OrderError, "Unknown artwork #{artwork_id}" if artwork.nil? || (edition_set_id && !find_edition_set(artwork, edition_set_id))

    Order.transaction do
      order = Order.create!(user_id: user_id, partner_id: artwork[:partner][:_id], currency_code: artwork[:price_currency], state: Order::PENDING)
      order.line_items.create!(
        artwork_id: artwork_id,
        edition_set_id: edition_set_id,
        price_cents: artwork_price(artwork, edition_set_id: edition_set_id),
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

  def self.artwork_price(external_artwork, edition_set_id: nil)
    if edition_set_id
      edition_set = find_edition_set(external_artwork, edition_set_id)
      raise Errors::OrderError, 'Unknown edition set.' unless edition_set
      price_in_cents(edition_set[:price_listed], edition_set[:price_currency])
    else
      price_in_cents(external_artwork[:price_listed], external_artwork[:price_currency])
    end
  end

  def self.find_edition_set(external_artwork, edition_set_id)
    external_artwork[:edition_sets].find { |e| e[:id] == edition_set_id }
  end

  # TODO: 🚨 update gravity to expose amount in cents and remove this duplicate logic
  # https://github.com/artsy/gravity/blob/65e398e3648d61175e7a8f4403a2d379b5aa2107/app/models/util/for_sale.rb#L221
  def self.price_in_cents(price_in_dollars, currency)
    raise Errors::OrderError, 'No price found' unless price_in_dollars&.positive?
    raise Errors::OrderError, 'Missing currency' if currency.blank?
    raise Errors::OrderError, 'Invalid currency' unless Order::SUPPORTED_CURRENCIES.include?(currency.downcase)
    (price_in_dollars * 100).round
  end
end

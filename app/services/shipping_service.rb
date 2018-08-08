module ShippingService
  def self.calculate_shipping(line_item, fulfillment_type:, shipping_country:)
    # TODO: 🚨 remove this feature flag, only needed during development 🚨
    return 0 if Rails.application.config_for(:dev_features)['disable_shipping_calculation']
    artwork = ArtworkService.find(line_item.artwork_id)
    raise Errors::OrderError, 'Cannot calculate shipping, unknown artwork' unless artwork
    raise Errors::OrderError, 'Cannot calculate shipping, missing artwork location' if artwork[:location].blank?

    if fulfillment_type == Order::PICKUP
      0
    elsif domestic?(artwork[:location], shipping_country)
      calculate_domestic(artwork)
    else
      calculate_international(artwork)
    end
  end

  def self.domestic?(artwork_location, shipping_country)
    artwork_location[:country].casecmp(shipping_country).zero?
  end

  def self.calculate_domestic(artwork)
    artwork[:domestic_shipping_fee_cents] || 0
  end

  def self.calculate_international(artwork)
    artwork[:international_shipping_fee_cents] || 0
  end
end

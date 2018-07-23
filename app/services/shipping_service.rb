module ShippingService
  def self.calculate_shipping(line_item, fulfillment_type:, shipping_country:)
    # TODO: 🚨 remove this feature flag, only needed during development 🚨
    return 0 if Rails.application.config_for(:dev_features)['disable_shipping_calculation']
    artwork = ArtworkService.find(line_item.artwork_id)
    raise Errors::OrderError, 'Cannot caclulate shipping, unknown artwork' unless artwork

    if free_shipping?(artwork) || fulfillment_type == Order::PICKUP
      0
    elsif domestic?(artwork[:location], shipping_country)
      calculate_domestic(artwork)
    else
      calculate_international(artwork)
    end
  end

  def self.free_shipping?(artwork)
    artwork[:free_shipping] == true
  end

  def self.domestic?(artwork_location, shipping_country)
    artwork_location[:country].casecmp(shipping_country).zero?
  end

  def self.calculate_domestic(artwork)
    artwork[:domestic_shipping_fee_cents]
  end

  def self.calculate_international(artwork)
    artwork[:international_shipping_fee_cents]
  end
end

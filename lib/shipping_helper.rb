class ShippingHelper
  def self.calculate(artwork, fulfillment_type, shipping_address = nil)
    consignment = artwork[:import_source] == 'convection'
    pickup = fulfillment_type == Order::PICKUP

    return 0 if consignment || pickup

    if artwork[:location].blank?
      exception = Errors::ValidationError.new(:missing_artwork_location, artwork_id: artwork[:_id])
      cents = nil
    elsif domestic?(artwork, shipping_address) || eu_local_shipping?(artwork, shipping_address)
      exception = Errors::ValidationError.new(:missing_domestic_shipping_fee)
      cents = artwork[:domestic_shipping_fee_cents]
    else
      exception = Errors::ValidationError.new(:unsupported_shipping_location, failure_code: :domestic_shipping_only)
      cents = artwork[:international_shipping_fee_cents]
    end

    cents || raise(exception)
  end

  def self.domestic?(artwork, shipping_address)
    artwork[:location][:country].casecmp(shipping_address.country).zero? && (shipping_address.country != Carmen::Country.coded('US').code || shipping_address.continental_us?)
  end

  def self.eu_local_shipping?(artwork, shipping_address)
    artwork[:eu_shipping_origin] && shipping_address.eu_local_shipping?
  end
end

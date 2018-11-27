class ShippingCalculatorService
  def initialize(artwork, fulfillment_type, shipping_address = nil)
    @artwork = artwork
    @fulfillment_type = fulfillment_type
    @shipping_address = shipping_address
  end

  def shipping_cents
    return 0 if @fulfillment_type == Order::PICKUP

    validate_shipping_location!
    if domestic_shipping?
      @artwork[:domestic_shipping_fee_cents] || raise(Errors::ValidationError, :missing_domestic_shipping_fee)
    else
      @artwork[:international_shipping_fee_cents] || raise(Errors::ValidationError.new(:unsupported_shipping_location, failure_code: :domestic_shipping_only))
    end
  end

  private

  def validate_shipping_location!
    raise Errors::ValidationError, :missing_country if @shipping_address&.country.blank?
  end

  def domestic_shipping?
    @artwork[:location][:country].casecmp(@shipping_address.country).zero? &&
      (@shipping_address.country != Carmen::Country.coded('US').code || @shipping_address.continental_us?)
  end

  def international_shipping?
    !domestic_shipping?
  end
end

class CreateOfferOrderService < CreateOrderService
  def initialize(user_id:, artwork_id:, edition_set_id: nil, quantity:)
    super(user_id: user_id, artwork_id: artwork_id, edition_set_id: edition_set_id, quantity: quantity, mode: Order::OFFER)
  end

  def assert_create!(artwork)
    # TODO: add following assertion once we know the field
    # raise Errors::ValidationError.new(:not_offerable, artwork_id: @artwork_id) unless @artwork[:offerable]
  end
end

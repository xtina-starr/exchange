class CreateOfferOrderService < BaseCreateOrderService
  def initialize(user_id:, artwork_id:, edition_set_id: nil, quantity:)
    super(user_id: user_id, artwork_id: artwork_id, edition_set_id: edition_set_id, quantity: quantity, mode: Order::OFFER)
  end

  def assert_create!(artwork)
    raise Errors::ValidationError.new(:not_offerable, artwork_id: artwork[:_id]) unless artwork[:offerable]
  end
end

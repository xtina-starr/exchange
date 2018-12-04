class Mutations::Offer::BuyerRejectOffer < Mutations::Offer::BaseRejectOffer
  alias authorize! authorize_buyer_request!
  def waiting_for_response?(offer)
    offer.from_participant == Order::SELLER # TODO: Where does this constant come from?
  end
end

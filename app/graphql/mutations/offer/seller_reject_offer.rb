class Mutations::Offer::SellerRejectOffer < Mutations::Offer::BaseRejectOffer
  alias authorize! authorize_seller_request!
  def waiting_for_response?(offer)
    offer.from_participant != Order::SELLER
  end
end

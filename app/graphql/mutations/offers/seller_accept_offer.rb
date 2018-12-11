class Mutations::Offers::SellerAcceptOffer < Mutations::Offers::BaseAcceptOffer
  alias authorize! authorize_seller_request!
  def waiting_for_accept?(offer)
    offer.from_participant != Order::SELLER
  end
end

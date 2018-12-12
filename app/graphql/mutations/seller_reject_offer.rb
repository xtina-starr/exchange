class Mutations::SellerRejectOffer < Mutations::BaseRejectOffer
  alias authorize! authorize_seller_request!
  def waiting_for_response?(offer)
    offer.from_participant == Order::BUYER
  end

  def sanitize_reject_reason(reject_reason)
    reject_reason || Order::REASONS[Order::CANCELED][:seller_rejected]
  end
end

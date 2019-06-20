# typed: false
class Mutations::BuyerRejectOffer < Mutations::BaseRejectOffer
  alias authorize! authorize_buyer_request!
  def waiting_for_response?(offer)
    offer.from_participant == Order::SELLER
  end

  def sanitize_reject_reason(reject_reason)
    reject_reason || Order::REASONS[Order::CANCELED][:buyer_rejected]
  end
end

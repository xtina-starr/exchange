class Mutations::SellerRejectOffer < Mutations::BaseMutation
  null true

  argument :offer_id, ID, required: true
  argument :reject_reason, Types::CancelReasonTypeEnum, required: true

  field :order_or_error, Mutations::OrderOrFailureUnionType, 'A union of success/failure', null: false

  def resolve(offer_id:, reject_reason:)
    offer = Offer.find(offer_id)
    order = offer.order

    authorize_seller_request!(order)

    Offers::RejectOfferService.new(offer: offer, reject_reason: reject_reason).process!

    { order_or_error: { order: order.reload } }
  rescue Errors::ApplicationError => e
    { order_or_error: { error: Types::ApplicationErrorType.from_application(e) } }
  end
end

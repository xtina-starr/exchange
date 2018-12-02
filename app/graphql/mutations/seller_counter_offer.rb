class Mutations::SellerCounterOffer < Mutations::BaseMutation
  null true

  argument :offer_id, ID, required: true
  argument :amount_cents, Integer, required: true

  field :order_or_error, Mutations::OrderOrFailureUnionType, 'A union of success/failure', null: false

  def resolve(offer_id:, amount_cents:)
    offer = Offer.find(offer_id)
    order = offer.order
    authorize_seller_request!(order)
    init_service = Offers::InitialCounterOfferService.new(offer: offer, amount_cents: amount_cents)
    pending_offer = init_service.process!

    submit_service = Offers::SubmitCounterOfferService.new(pending_offer: pending_offer)
    submit_service.process!

    { order_or_error: { order: order.reload } }
  rescue Errors::ApplicationError => e
    { order_or_error: { error: Types::ApplicationErrorType.from_application(e) } }
  end
end

class Mutations::Offer::BaseAcceptOffer < Mutations::BaseMutation
  null true

  argument :offer_id, ID, required: true

  field :order_or_error, Mutations::OrderOrFailureUnionType, 'A union of success/failure', null: false

  def resolve(offer_id:)
    offer = Offer.find(offer_id)
    order = offer.order

    authorize!(order)
    raise Errors::ValidationError, :cannot_accept_offer unless waiting_for_accept?(offer)

    Offers::AcceptOfferService.new(
      offer: offer,
      order: order,
      user_id: current_user_id
    ).process!

    { order_or_error: { order: order.reload } }
  rescue Errors::ApplicationError => e
    { order_or_error: { error: Types::ApplicationErrorType.from_application(e) } }
  end

  def authorize!(_order)
    raise NotImplementedError
  end

  def waiting_for_accept?(_offer)
    raise NotImplementedError
  end
end

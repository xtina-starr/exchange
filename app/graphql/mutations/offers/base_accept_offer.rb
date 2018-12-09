class Mutations::Offers::BaseAcceptOffer < Mutations::BaseMutation
  null true

  argument :offer_id, ID, required: true

  field :order_or_error, Mutations::OrderOrFailureUnionType, 'A union of success/failure', null: false

  def resolve(offer_id:)
    offer = Offer.find(offer_id)

    authorize!(offer)
    raise Errors::ValidationError, :cannot_accept_offer unless waiting_for_accept?(offer)

    service = ::Offers::AcceptOfferService.new(
      offer,
      user_id: current_user_id
    )
    service.process!

    { order_or_error: { order: service.offer.order.reload } }
  rescue Errors::ApplicationError => e
    { order_or_error: { error: Types::ApplicationErrorType.from_application(e) } }
  end

  def authorize!(_offer)
    raise NotImplementedError
  end

  def waiting_for_accept?(_offer)
    raise NotImplementedError
  end
end

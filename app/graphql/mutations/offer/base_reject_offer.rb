class Mutations::Offer::BaseRejectOffer < Mutations::BaseMutation
  null true # TODO: Find out what this does

  argument :offer_id, ID, required: true
  argument :reject_reason, Types::CancelReasonTypeEnum, required: false

  field :order_or_error, Mutations::OrderOrFailureUnionType, 'A union of success/failure', null: false

  def resolve(offer_id:, reject_reason: nil)
    offer = Offer.find(offer_id)
    order = offer.order

    authorize!(order)
    raise Errors::ValidationError, :cannot_reject_offer unless waiting_for_response?(offer)
    # TODO: if reject_reason is nil, we need to set it based on the user_id making the request
    
    Offers::RejectOfferService.new(offer: offer, reject_reason: reject_reason).process!

    { order_or_error: { order: order.reload } }
  rescue Errors::ApplicationError => e
    { order_or_error: { error: Types::ApplicationErrorType.from_application(e) } }
  end

  def authorize!(_order)
    raise NotImplementedError
  end

  def waiting_for_response?(_offer)
    raise NotImplementedError
  end
end
  
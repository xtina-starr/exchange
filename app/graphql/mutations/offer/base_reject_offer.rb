class Mutations::Offer::BaseRejectOffer < Mutations::BaseMutation

  argument :offer_id, ID, required: true
  argument :reject_reason, Types::CancelReasonTypeEnum, required: false

  field :order_or_error, Mutations::OrderOrFailureUnionType, 'A union of success/failure', null: false

  def resolve(offer_id:, reject_reason: nil)
    offer = Offer.find(offer_id)
    order = offer.order

    authorize!(order)
    raise Errors::ValidationError, :cannot_reject_offer unless waiting_for_response?(offer)

    if reject_reason.nil?
      reject_reason = if current_user_id.eql? offer.order.buyer_id
                        Order::REASONS[Order::CANCELED][:buyer_rejected]
                      else
                        Order::REASONS[Order::CANCELED][:seller_rejected]
                      end
    end

    Offers::RejectOfferService.new(offer: offer, reject_reason: reject_reason, user_id: current_user_id).process!

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

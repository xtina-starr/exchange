class Types::OfferOrderType < Types::BaseObject
  implements Types::OrderInterface

  field :offers, Types::OfferType.connection_type, null: true do
    argument :from_id, String, required: false
    argument :from_type, String, required: false
  end
  field :offer_total_cents, Integer, null: false, deprecation_reason: 'itemsTotalCents reflects offer total for offer orders.'
  field :last_offer, Types::OfferType, null: true, description: 'Last submitted offer'
  field :my_last_offer, Types::OfferType, null: true
  field :awaiting_response_from, Types::OrderParticipantEnum, null: true

  def offers(**args)
    offers = object.offers.submitted
    offers = offers.where(args.slice(:from_id, :from_type)) if args.keys.any? { |ar| %i[from_id from_type].include? ar }
    offers
  end

  def offer_total_cents
    # This can be removed once reaction is updated to `itemsTotalCents`
    object.items_total_cents
  end

  def my_last_offer
    return unless context[:current_user][:id]

    object.offers.where(creator_id: context[:current_user][:id]).order(created_at: :desc).first
  end

  def awaiting_response_from
    return unless object.mode == Order::OFFER && object.state == Order::SUBMITTED

    if object&.last_offer&.from_id == object.seller_id && object&.last_offer&.from_type == object.seller_type
      'buyer'
    elsif object&.last_offer&.from_id == object.buyer_id && object&.last_offer&.from_type == object.buyer_type
      'seller'
    end
  end
end

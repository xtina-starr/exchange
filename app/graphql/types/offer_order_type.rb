class Types::OfferOrderType < Types::BaseObject
  implements Types::OrderInterface

  field :offers, Types::OfferType.connection_type, null: true do
    argument :from_id, String, required: false
    argument :from_type, String, required: false
    argument :include_pending, Boolean, required: false
  end
  field :offer_total_cents, Integer, null: false, deprecation_reason: 'itemsTotalCents reflects offer total for offer orders.'
  field :last_offer, Types::OfferType, null: true, description: 'Last submitted offer'
  field :my_last_offer, Types::OfferType, null: true
  field :waiting_buyer_response, Boolean, null: true
  field :waiting_seller_response, Boolean, null: true

  def offers(**args)
    include_pending = args.delete(:include_pending)
    offers = include_pending ? object.offers.all : object.offers.submitted
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
end

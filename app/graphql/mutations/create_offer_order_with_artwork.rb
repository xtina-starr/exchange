class Mutations::CreateOfferOrderWithArtwork < Mutations::BaseMutation
  null true

  argument :artwork_id, String, 'Artwork Id', required: true
  argument :edition_set_id, String, 'EditionSet Id', required: false
  argument :quantity, Integer, 'Number of items in the line item', required: false

  field :order_or_error, Mutations::OrderOrErrorUnionType, 'A union of Order/ApplicationError', null: false

  def resolve(artwork_id:, edition_set_id: nil, quantity: 1)
    service = CreateOfferOrderService.new(user_id: context[:current_user][:id], artwork_id: artwork_id, edition_set_id: edition_set_id, quantity: quantity)
    service.process!
    {
      order_or_error: service.order
    }
  rescue Errors::ApplicationError => e
    { order_or_error: Types::ApplicationErrorType.from_application(e) }
  end
end

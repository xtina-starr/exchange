class Mutations::CreateOrderWithArtwork < Mutations::BaseMutation
  argument :artwork_id, String, 'Artwork Id', required: true
  argument :edition_set_id, String, 'EditionSet Id', required: false
  argument :quantity, Integer, 'Number of items in the line item', required: false

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(artwork_id:, edition_set_id: nil, quantity: 1)
    {
      order: CreateOrderService.with_artwork!(user_id: context[:current_user][:id], artwork_id: artwork_id, edition_set_id: edition_set_id, quantity: quantity),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end
end

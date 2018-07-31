
class Types::OrderOrFailureSubject < Types::BaseUnion
  description 'Represents either a resolved Order or a potential failure'
  possible_types Types::OrderType, Types::MutationErrorType
end

class Mutations::CreateOrderWithArtwork < Mutations::BaseMutation
  argument :artwork_id, String, 'Artwork Id', required: true
  argument :edition_set_id, String, 'EditionSet Id', required: false
  argument :quantity, Integer, 'Number of items in the line item', required: false

  field :orderOrError, Types::OrderOrFailureSubject, null: false

  def resolve(artwork_id:, edition_set_id: nil, quantity: 1)
    {
      orderOrError: CreateOrderService.with_artwork!(user_id: context[:current_user][:id], artwork_id: artwork_id, edition_set_id: edition_set_id, quantity: quantity)
    }
  rescue Errors::ApplicationError => e
    { orderOrError: Types::MutationErrorType.from_application(e) }
  end
end

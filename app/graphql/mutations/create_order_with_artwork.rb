class Mutations::CreateOrderWithArtworkMutationSucesss < Types::BaseObject
  description 'A successfully created type'
  field :order, Types::OrderType, null: false
end

class Mutations::CreateOrderWithArtworkMutationFailure < Types::BaseObject
  description 'A failed order type'
  field :error, Types::MutationErrorType, null: false
end

class Mutations::CreateOrderOrFailureSubject < Types::BaseUnion
  description 'Represents either a resolved Order or a potential failure'
  possible_types Mutations::CreateOrderWithArtworkMutationSucesss, Mutations::CreateOrderWithArtworkMutationFailure
end

class Mutations::CreateOrderWithArtwork < Mutations::BaseMutation
  null true

  argument :artwork_id, String, 'Artwork Id', required: true
  argument :edition_set_id, String, 'EditionSet Id', required: false
  argument :quantity, Integer, 'Number of items in the line item', required: false

  field :orderOrError, Mutations::CreateOrderOrFailureSubject, null: false

  def resolve(artwork_id:, edition_set_id: nil, quantity: 1)
    {
      orderOrError: { order: CreateOrderService.with_artwork!(user_id: context[:current_user][:id], artwork_id: artwork_id, edition_set_id: edition_set_id, quantity: quantity) }
    }
  rescue Errors::ApplicationError => e
    puts "OK"
    { orderOrError: { error: Types::MutationErrorType.from_application(e) } }
  end
end

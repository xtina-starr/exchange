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

  def self.resolve_type(object, _context)
    if object.key?(:order)
      Mutations::CreateOrderWithArtworkMutationSucesss
    elsif object.key?(:error)
      Mutations::CreateOrderWithArtworkMutationFailure
    else
      raise "Unexpected Return value: #{object.inspect}"
    end
  end
end

class Mutations::CreateOrderWithArtwork < Mutations::BaseMutation
  null true

  argument :artwork_id, String, 'Artwork Id', required: true
  argument :edition_set_id, String, 'EditionSet Id', required: false
  argument :quantity, Integer, 'Number of items in the line item', required: false

  field :order_or_error, Mutations::CreateOrderOrFailureSubject, 'A union of success/failure', null: false

  def resolve(artwork_id:, edition_set_id: nil, quantity: 1)
    {
      order_or_error: { order: CreateOrderService.with_artwork!(user_id: context[:current_user][:id], artwork_id: artwork_id, edition_set_id: edition_set_id, quantity: quantity) }
    }
  rescue Errors::ApplicationError => e
    { order_or_error: { error: Types::MutationErrorType.from_application(e) } }
  end
end

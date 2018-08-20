class Mutations::OrderWithMutationSucesss < Types::BaseObject
  description 'A successfully returned order type'
  field :order, Types::OrderType, null: false
end

class Mutations::OrderWithMutationFailure < Types::BaseObject
  description 'An error response for changes to an order'
  field :error, Types::MutationErrorType, null: false
end

class Mutations::OrderOrFailureUnionType < Types::BaseUnion
  description 'Represents either a resolved Order or a potential failure'
  possible_types Mutations::OrderWithMutationSucesss, Mutations::OrderWithMutationFailure

  def self.resolve_type(object, _context)
    if object.key?(:order)
      Mutations::OrderWithMutationSucesss
    elsif object.key?(:error)
      Mutations::OrderWithMutationFailure
    else
      raise "Unexpected Return value: #{object.inspect}"
    end
  end
end

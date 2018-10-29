class Mutations::ObjectOrErrorUnionType < Types::BaseUnion
  description 'Represents either a resolved Order or a potential failure'
  possible_types Types::OrderType, Types::ApplicationErrorType

  def self.resolve_type(object, _context)
    case object
    when Order then Types::OrderType
    when Offer then Types::OfferType
    when Errors::ApplicationError then Types::ApplicationErrorType
    else
      raise "Unexpected Return value: #{object.inspect}"
    end
  end
end

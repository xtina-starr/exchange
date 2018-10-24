class Mutations::OrderOrErrorUnionType < Types::BaseUnion
  description 'Represents either a resolved Order or a potential failure'
  possible_types Types::OrderType, Types::ApplicationErrorType

  def self.resolve_type(object, _context)
    if object.is_a?(Order)
      Types::OrderType
    elsif object.key?(:code)
      Types::ApplicationErrorType
    else
      raise "Unexpected Return value: #{object.inspect}"
    end
  end
end

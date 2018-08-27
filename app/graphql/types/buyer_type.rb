class Types::Partner < Types::BaseObject
  field :id
end

class Types::User < Types::BaseObject
  field :id
end

class Types::BuyerType < Types::BaseUnion
  description 'Represents either a partner or a user'
  possible_types Types::Partner, Types::User

  def self.resolve_type(object, _context)
    case object.buyer_type
    when Order::USER
      Types::User
    when Order::PARTNER
      Types::Partner
    else
      raise "Unexpected return value: #{object.inspect}"
    end
  end
end

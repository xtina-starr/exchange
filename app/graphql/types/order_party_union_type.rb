class Types::Partner < Types::BaseObject
  field :id, String, null: false
  field :type, String, null: false
end

class Types::User < Types::BaseObject
  field :id, String, null: false
end

class Types::OrderPartyUnionType < Types::BaseUnion
  description 'Represents either a partner or a user'
  possible_types Types::Partner, Types::User
  def self.resolve_type(object, _context)
    case object.type
    when Order::USER
      Types::User
    else
      Types::Partner
    end
  end
end

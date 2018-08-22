class Types::Ship < Types::BaseObject
  field :name, String, null: true
  field :address_line1, String, null: true
  field :address_line2, String, null: true
  field :city, String, null: true
  field :region, String, null: true
  field :country, String, null: true
  field :postal_code, String, null: true

  # generate methods for mapping above fields to field name on the model
  %w[name address_line1 address_line2 city region country postal_code].each do |field_name|
    define_method field_name do
      object.send("shipping_#{field_name}".to_sym)
    end
  end
end

class Types::Pickup < Types::BaseObject; end

class Types::FulfillmentUnionType < Types::BaseUnion
  description 'Represents either a shipping information or pickup'
  possible_types Types::Ship, Types::Pickup

  def self.resolve_type(object, _context)
    case object.fulfillment_type
    when Order::SHIP
      Types::Ship
    when Order::PICKUP
      Types::Pickup
    else
      raise "Unexpected Return value: #{object.inspect}"
    end
  end
end

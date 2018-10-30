class Types::OfferType < Types::BaseObject
  description 'An Offer'
  graphql_name 'Offer'

  field :id, ID, null: false
  field :offerer, Types::OrderPartyUnionType, null: false
  field :state, Types::OrderStateEnum, null: false
  field :amount_cents, Integer, null: false
  field :created_at, Types::DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
end

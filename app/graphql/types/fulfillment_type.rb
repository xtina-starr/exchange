class Types::FulfillmentType < Types::BaseObject
  description 'A Fulfillment for an order'
  graphql_name 'Fulfillment'

  field :id, ID, null: false
  field :courier, String, null: false
  field :tracking_id, String, null: true
  field :estimated_delivery, Types::DateType, null: true
  field :notes, String, null: true
  field :created_at, Types::DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
end

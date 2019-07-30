class Types::OrderActionDataType < Types::BaseObject
  description 'Order Action data'
  graphql_name 'OrderActionData'

  field :client_secret, String, null: false
end

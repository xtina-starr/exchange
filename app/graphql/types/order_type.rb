class Types::OrderType < Types::BaseObject
  description 'An Order'
  graphql_name 'Order'

  field :id, ID, null: false
  field :code, String, null: false
  field :user_id, String, null: false
  field :partner_id, String, null: false
  field :state, String, null: false
  field :currency_code, String, null: false
  field :created_at, Types::DateTimeType, null: false
  field :update_at, Types::DateTimeType, null: false
  field :line_items, Types::LineItemType.connection_type, null: true
end

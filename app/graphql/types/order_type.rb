class Types::OrderType < Types::BaseObject
  description 'An Order'
  graphql_name 'Order'

  field :id, ID, null: false
  field :code, String, null: false
  field :user_id, String, null: false
  field :partner_id, String, null: false
  field :state, Types::OrderStateEnum, null: false
  field :currency_code, String, null: false
  field :items_total_cents, Integer, null: false
  field :shipping_total_cents, Integer, null: true
  field :tax_total_cents, Integer, null: true
  field :transaction_fee_cents, Integer, null: true
  field :commission_fee_cents, Integer, null: true
  field :created_at, Types::DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
  field :state_updated_at, Types::DateTimeType, null: true
  field :state_expires_at, Types::DateTimeType, null: true
  field :line_items, Types::LineItemType.connection_type, null: true
end

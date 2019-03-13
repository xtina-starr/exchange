Fabricator(:order) do
  mode { Order::BUY }
  code { SecureRandom.hex(10) }
  buyer_id { sequence(:user_id) { |i| "user-id-#{i}" } }
  buyer_type { 'user' }
  seller_id { sequence(:seller_id) { |i| "partner-id-#{i}" } }
  seller_type { 'gallery' }
  state { Order::PENDING }
  currency_code { 'USD' }
  payment_method { Order::CREDIT_CARD }
end

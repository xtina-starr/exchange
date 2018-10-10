Fabricator(:order) do
  code { SecureRandom.hex(10) }
  buyer_id { sequence(:user_id) { |i| "user-id-#{i}" } }
  buyer_type { 'user' }
  seller_id { sequence(:partner_id) { |i| "partner-id-#{i}" } }
  seller_type { 'gallery' }
  state { Order::PENDING }
  items_total_cents { 0 }
  currency_code { 'USD' }
end

Fabricator(:order) do
  mode { Order::BUY }
  code { SecureRandom.hex(10) }
  buyer_id { sequence(:user_id) { |i| "user-id-#{i}" } }
  buyer_type { 'user' }
  seller_id { sequence(:partner_id) { |i| "partner-id-#{i}" } }
  seller_type { 'gallery' }
  state { Order::PENDING }
  state_reason { nil }
  items_total_cents { 0 }
  currency_code { 'USD' }
  shipping_total_cents { 100_00 }
  commission_fee_cents { 50_00 }
  commission_rate { 0.10 }
  seller_total_cents { 50_00 }
  buyer_total_cents { 100_00 }
  items_total_cents { 0 }
end

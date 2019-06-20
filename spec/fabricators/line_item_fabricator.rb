# typed: false
Fabricator(:line_item) do
  list_price_cents { 100_00 }
  artwork_id { sequence(:artwork_id) { |i| "artwork-id-#{i}" } }
  quantity { 1 }
  order { Fabricate(:order) }
end

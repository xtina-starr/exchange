
Fabricator(:line_item) do
  price_cents { 100_00 }
  artwork_id { sequence(:artwork_id) { |i| "artwork-id-#{i}" } }
  order { Fabricate(:order) }
end
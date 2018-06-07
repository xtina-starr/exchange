
Fabricator(:order_line_ite,) do
  price_in_cents { 100_00 }
  artwork_id { sequence(:artwork_id) { |i| "artwork-id-#{i}" } }
  order { Fabricate(:order) }
end
Fabricator(:line_item) do
  list_price_cents { 100_00 }
  artwork_id { sequence(:artwork_id) { |i| "artwork-id-#{i}" } }
  artwork_version_id { sequence(:artwork_version_id) { |i| "artwork-version-id-#{i}" } }
  quantity { 1 }
  order { Fabricate(:order) }
end

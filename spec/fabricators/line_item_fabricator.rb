Fabricator(:line_item) do
  list_price_cents { 100_00 }
  artwork_id { sequence(:artwork_id) { |i| "artwork-id-#{i}" } }
  artwork_version_id do
    sequence(:artwork_version_id) { |i| "artwork-version-id-#{i}" }
  end
  quantity { 1 }
  order { Fabricate(:order) }
end

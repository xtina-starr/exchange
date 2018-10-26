Fabricator(:admin_note) do
  order { Fabricate(:order) }
  admin_id { sequence(:admin_id) { |i| "admin-id-#{i}" } }
end

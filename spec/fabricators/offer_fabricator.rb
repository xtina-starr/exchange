# typed: false
Fabricator(:offer) do
  from_id { sequence(:user_id) { |i| "user-id-#{i}" } }
  from_type { 'user' }
  order { Fabricate(:order) }
end

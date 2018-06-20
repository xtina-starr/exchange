Fabricator(:order) do
  code { SecureRandom.hex(10) }
  user_id { sequence(:user_id) { |i| "user-id-#{i}" } }
  partner_id { sequence(:partner_id) { |i| "partner-id-#{i}" } }
  state { Order::PENDING }
end

# typed: false
Fabricator(:transaction) do
  external_id { SecureRandom.hex(10) }
  source_id { SecureRandom.hex(10) }
  order { Fabricate(:order) }
end

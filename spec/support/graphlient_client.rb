require 'graphlient'

RSpec.shared_context 'GraphQL Client', shared_context: :metadata do
  let(:jwt_user_id) { 'user-id' }
  let(:jwt_partner_ids) { ['partner-id'] }
  let(:auth_headers) { jwt_headers(user_id: jwt_user_id, partner_ids: jwt_partner_ids) }
  let(:client) do
    Graphlient::Client.new('http://localhost:4000/api/graphql', headers: auth_headers) do |client|
      client.http do |h|
        h.connection do |c|
          c.use Faraday::Adapter::Rack, app
        end
      end
    end
  end
end

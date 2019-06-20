# typed: false
require 'graphlient'

RSpec.shared_context 'GraphQL Client', shared_context: :metadata do
  let(:jwt_user_id) { 'user-id' }
  let(:jwt_partner_ids) { ['partner-id'] }
  let(:jwt_roles) { 'user' }
  let(:auth_headers) { jwt_headers(user_id: jwt_user_id, partner_ids: jwt_partner_ids, roles: jwt_roles) }
  let(:user_agent) { 'user-agent' }
  let(:user_ip) { 'user-ip' }
  let(:analytics_headers) { { 'User-Agent' => user_agent, 'x-forwarded-for' => user_ip } }
  let(:headers) { auth_headers.merge(analytics_headers) }
  let(:client) do
    Graphlient::Client.new('http://localhost:4000/api/graphql', headers: headers) do |client|
      client.http do |h|
        h.connection do |c|
          c.use Faraday::Adapter::Rack, app
        end
      end
    end
  end
end

RSpec.shared_context 'GraphQL Client Helpers', shared_context: :metadata do
  def graphql_client(user_id:, partner_ids:, roles:, user_agent: 'user-agent', user_ip: 'user-ip')
    auth_headers = jwt_headers(user_id: user_id, partner_ids: partner_ids, roles: roles).merge('User-Agent' => user_agent, 'x-forwarded-for' => user_ip)
    Graphlient::Client.new('http://localhost:4000/api/graphql', headers: auth_headers) do |client|
      client.http do |h|
        h.connection do |c|
          c.use Faraday::Adapter::Rack, app
        end
      end
    end
  end
end

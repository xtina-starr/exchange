require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'orders query' do
    include_context 'GraphQL Client'
    let(:partner_id) { jwt_partner_ids.first }
    let(:second_partner_id) { 'partner-2' }
    let(:user_id) { jwt_user_id }
    let(:second_user) { 'user2' }
    let!(:user1_order1) { Fabricate(:order, partner_id: partner_id, user_id: user_id, updated_at: 1.day.ago) }
    let!(:user1_order2) { Fabricate(:order, partner_id: second_partner_id, user_id: user_id, updated_at: 1.day.from_now) }
    let!(:user2_order1) { Fabricate(:order, partner_id: partner_id, user_id: second_user) }

    let(:query) do
      <<-GRAPHQL
        query($userId: String, $partnerId: String, $state: OrderStateEnum, $sort: OrderConnectionSortEnum) {
          orders(userId: $userId, partnerId: $partnerId, state: $state, sort: $sort) {
            edges{
              node{
                id
                userId
                partnerId
                state
              }
            }
          }
        }
      GRAPHQL
    end

    it 'returns error when missing both userId and partnerId' do
      expect do
        client.execute(query, state: 'PENDING')
      end.to raise_error(Graphlient::Errors::ExecutionError, 'orders: requires one of userId or partnerId')
    end

    context 'query with partnerId' do
      it 'returns permission error when query for partnerId not in jwt' do
        expect do
          client.execute(query, partnerId: 'someone-elses-partnerid')
        end.to raise_error(Graphlient::Errors::ExecutionError, 'orders: Not permitted')
      end
    end

    context 'query with userId' do
      it 'returns permission error when query for user not in jwt' do
        expect do
          client.execute(query, userId: 'someone-elses-userid')
        end.to raise_error(Graphlient::Errors::ExecutionError, 'orders: Not permitted')
      end

      it 'returns users orders' do
        results = client.execute(query, userId: user_id)
        expect(results.data.orders.edges.count).to eq 2
        expect(results.data.orders.edges.map(&:node).map(&:id)).to match_array([user1_order1.id, user1_order2.id].map(&:to_s))
      end

      it 'returns partners orders' do
        results = client.execute(query, partnerId: partner_id)
        expect(results.data.orders.edges.count).to eq 2
        expect(results.data.orders.edges.map(&:node).map(&:id)).to match_array([user1_order1.id, user2_order1.id].map(&:to_s))
      end

      it 'sorts by updated_at in ascending order' do
        results = client.execute(query, userId: user_id, sort: 'UPDATED_AT_ASC')
        expect(results.data.orders.edges.map(&:node).map(&:id).map(&:to_i)).to eq([user1_order1.id, user1_order2.id])
      end

      it 'sorts by updated_at in descending order' do
        results = client.execute(query, userId: user_id, sort: 'UPDATED_AT_DESC')
        expect(results.data.orders.edges.map(&:node).map(&:id).map(&:to_i)).to eq([user1_order2.id, user1_order1.id])
      end
    end
  end
end

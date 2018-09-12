require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'orders query' do
    include_context 'GraphQL Client'
    let(:partner_id) { jwt_partner_ids.first }
    let(:second_partner_id) { 'partner-2' }
    let(:user_id) { jwt_user_id }
    let(:second_user) { 'user2' }
    let!(:user1_order1) { Fabricate(:order, seller_type: 'partner', seller_id: partner_id, buyer_type: 'user', buyer_id: user_id, updated_at: 1.day.ago) }
    let!(:user1_order2) { Fabricate(:order, seller_type: 'partner', seller_id: second_partner_id, buyer_type: 'user', buyer_id: user_id, updated_at: 1.day.from_now) }
    let!(:user2_order1) { Fabricate(:order, seller_type: 'partner', seller_id: partner_id, buyer_type: 'user', buyer_id: second_user) }

    let(:query) do
      <<-GRAPHQL
        query($sellerId: String, $buyerId: String, $state: OrderStateEnum, $sort: OrderConnectionSortEnum) {
          orders(sellerId: $sellerId, buyerId: $buyerId, state: $state, sort: $sort) {
            edges {
              node {
                id
                buyer {
                  ... on Partner {
                    id
                  }
                }
                seller {
                  ... on User {
                    id
                  }
                }
                state
                currencyCode
                itemsTotalCents
                lineItems{
                  edges{
                    node{
                      priceCents
                    }
                  }
                }
                requestedFulfillment{
                  ... on Ship {
                    name
                  }
                }
              }
            }
          }
        }
      GRAPHQL
    end

    it 'returns error when missing both buyerId and sellerId' do
      expect do
        client.execute(query, state: 'PENDING')
      end.to raise_error(Graphlient::Errors::ExecutionError, 'orders: requires one of sellerId or buyerId')
    end

    context 'query with sellerId' do
      it 'returns permission error when query for sellerId not in jwt' do
        expect do
          client.execute(query, sellerId: 'someone-elses-partnerid')
        end.to raise_error(Graphlient::Errors::ExecutionError, 'orders: Not found')
      end
      it 'returns partners orders' do
        results = client.execute(query, sellerId: partner_id)
        expect(results.data.orders.edges.count).to eq 2
        expect(results.data.orders.edges.map(&:node).map(&:id)).to match_array([user1_order1.id, user2_order1.id].map(&:to_s))
      end
    end

    context 'query with buyerId' do
      it 'returns buyers orders' do
        results = client.execute(query, buyerId: user_id)
        expect(results.data.orders.edges.count).to eq 2
        expect(results.data.orders.edges.map(&:node).map(&:id)).to match_array([user1_order1.id, user1_order2.id].map(&:to_s))
      end

      it 'sorts by updated_at in ascending order' do
        results = client.execute(query, buyerId: user_id, sort: 'UPDATED_AT_ASC')
        expect(results.data.orders.edges.map(&:node).map(&:id).map(&:to_i)).to eq([user1_order1.id, user1_order2.id])
      end

      it 'sorts by updated_at in descending order' do
        results = client.execute(query, buyerId: user_id, sort: 'UPDATED_AT_DESC')
        expect(results.data.orders.edges.map(&:node).map(&:id).map(&:to_i)).to eq([user1_order2.id, user1_order1.id])
      end
    end

    context 'trusted user rules' do
      let(:jwt_user_id) { 'rando' }

      context 'trusted account accessing another account\'s order' do
        let(:jwt_roles) { 'trusted' }
        it 'allows access' do
          expect do
            client.execute(query, buyerId: 'someone-elses-userid')
          end.to_not raise_error
        end
      end

      context 'untrusted account accessing another account\'s order' do
        let(:jwt_roles) { 'foobar' }
        it 'raises error' do
          expect do
            client.execute(query, buyerId: 'someone-elses-userid')
          end.to raise_error(Graphlient::Errors::ExecutionError, 'orders: Not found')
        end
      end
    end

    describe 'total_count' do
      let(:query_with_total_count) do
        <<-GRAPHQL
          query($sellerId: String, $buyerId: String, $state: OrderStateEnum, $sort: OrderConnectionSortEnum) {
            orders(sellerId: $sellerId, buyerId: $buyerId, state: $state, sort: $sort, first: 2) {
              totalCount
              edges {
                node {
                  id
                }
              }
            }
          }
        GRAPHQL
      end
      before do
        Fabricate.times(10, :order, seller_type: 'partner', seller_id: partner_id)
      end
      it 'returns proper total count' do
        results = client.execute(query_with_total_count, sellerId: partner_id)
        expect(results.data.orders.total_count).to eq 12
        expect(results.data.orders.edges.count).to eq 2
      end
    end
  end
end

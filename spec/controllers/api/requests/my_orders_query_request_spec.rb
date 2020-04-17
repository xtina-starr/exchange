require 'rails_helper'

describe Api::GraphqlController, type: :request do
  def ids_from_my_orders_result_data(result)
    result.data.my_orders.edges.map(&:node).map(&:id)
  end
  describe 'my_orders query' do
    include_context 'GraphQL Client'
    let(:seller_id) { jwt_partner_ids.first }
    let(:second_seller_id) { 'partner-2' }
    let(:my_user_id) { jwt_user_id }
    let(:another_user) { 'user2' }
    let!(:user1_order1) { Fabricate(:order, seller_type: 'partner', seller_id: seller_id, buyer_type: 'user', buyer_id: my_user_id, updated_at: 3.days.ago) }
    let!(:user1_order2) { Fabricate(:order, seller_type: 'partner', seller_id: second_seller_id, buyer_type: 'user', buyer_id: my_user_id, updated_at: 2.days.ago) }
    let!(:user1_offer_order1) { Fabricate(:order, seller_type: 'partner', seller_id: second_seller_id, buyer_type: 'user', buyer_id: my_user_id, updated_at: 1.day.ago, mode: Order::OFFER) }
    let!(:user2_order1) { Fabricate(:order, seller_type: 'partner', seller_id: seller_id, buyer_type: 'user', buyer_id: another_user) }

    let(:query) do
      <<-GRAPHQL
        query($sellerId: String, $state: OrderStateEnum, $sort: OrderConnectionSortEnum, $mode: OrderModeEnum, $first: Int) {
          myOrders(sellerId: $sellerId, state: $state, sort: $sort, mode: $mode, first: $first) {
            totalCount
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
              }
            }
          }
        }
      GRAPHQL
    end

    context 'as user' do
      it 'returns orders by a seller' do
        result = client.execute(query, sellerId: second_seller_id)
        expect(result.data.my_orders.edges.count).to eq 2
        ids = ids_from_my_orders_result_data(result)
        expect(ids).to match_array([user1_order2.id, user1_offer_order1.id])
      end

      it 'returns order in specified state' do
        fulfilled_order = Fabricate(:order, buyer_id: my_user_id, state: Order::FULFILLED)
        result = client.execute(query, state: 'FULFILLED')
        ids = ids_from_my_orders_result_data(result)
        expect(ids).to match_array([fulfilled_order.id])
      end

      it 'returns my orders' do
        result = client.execute(query)
        expect(result.data.my_orders.edges.count).to eq 3
        ids = ids_from_my_orders_result_data(result)
        expect(ids).to match_array([user1_order1.id, user1_order2.id, user1_offer_order1.id])
      end

      it 'returns proper total count' do
        Fabricate.times(10, :order, buyer_id: my_user_id, seller_type: 'partner', seller_id: seller_id)
        results = client.execute(query, sellerId: seller_id, first: 2)
        expect(results.data.my_orders.total_count).to eq 11
        expect(results.data.my_orders.edges.count).to eq 2
      end

      describe 'sort' do
        it 'sorts by updated_at in ascending order' do
          result = client.execute(query, sort: 'UPDATED_AT_ASC')
          ids = ids_from_my_orders_result_data(result)
          expect(ids).to eq([user1_order1.id, user1_order2.id, user1_offer_order1.id])
        end

        it 'sorts by updated_at in descending order' do
          result = client.execute(query, sort: 'UPDATED_AT_DESC')
          ids = ids_from_my_orders_result_data(result)
          expect(ids).to eq([user1_offer_order1.id, user1_order2.id, user1_order1.id])
        end

        it 'sorts by state_updated_at in ascending order' do
          user1_order1.update!(state_updated_at: Time.zone.now)
          result = client.execute(query, sort: 'STATE_UPDATED_AT_ASC')
          ids = ids_from_my_orders_result_data(result)
          expect(ids).to eq([user1_order2.id, user1_offer_order1.id, user1_order1.id])
        end

        it 'sorts by state_updated_at in descending order' do
          user1_order1.update!(state_updated_at: Time.zone.now)
          result = client.execute(query, sort: 'STATE_UPDATED_AT_DESC')
          ids = ids_from_my_orders_result_data(result)
          expect(ids).to eq([user1_order1.id, user1_offer_order1.id, user1_order2.id])
        end

        it 'sorts by state_expires_at in ascending order' do
          user1_order1.update!(state_expires_at: 1.day.from_now)
          user1_order2.update!(state_expires_at: 2.days.from_now)
          result = client.execute(query, sort: 'STATE_EXPIRES_AT_ASC')
          ids = ids_from_my_orders_result_data(result)
          expect(ids).to eq([user1_order1.id, user1_offer_order1.id, user1_order2.id])
        end

        it 'sorts by state_expires_at in descending order' do
          user1_order1.update!(state_expires_at: 1.day.from_now)
          user1_order2.update!(state_expires_at: 2.days.from_now)
          result = client.execute(query, sort: 'STATE_EXPIRES_AT_DESC')
          ids = ids_from_my_orders_result_data(result)
          expect(ids).to eq([user1_order2.id, user1_offer_order1.id, user1_order1.id])
        end
      end
    end

    context 'as an app' do
      let(:jwt_user_id) { nil }
      it 'raises error' do
        expect do
          client.execute(query)
        end.to raise_error do |error|
          expect(error).to be_a(Graphlient::Errors::ServerError)
          expect(error.status_code).to eq 404
          expect(error.message).to eq 'the server responded with status 404'
          expect(error.response['errors'].first['extensions']['code']).to eq 'not_found'
          expect(error.response['errors'].first['extensions']['type']).to eq 'validation'
        end
      end
    end
  end
end

require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'competing orders query' do
    include_context 'GraphQL Client'

    let(:query) do
      <<-GRAPHQL
          query($orderId: ID!, $sellerId: String!) {
            competingOrders(orderId: $orderId, sellerId: $sellerId) {
              totalCount
            }
          }
      GRAPHQL
    end

    context 'without required params' do
      it 'raises a graphql error' do
        expect do
          client.execute(query)
        end.to raise_error do |error|
          expect(error).to be_a(Graphlient::Errors::GraphQLError)
        end
      end
    end

    context 'with an order id and a seller id' do
      let(:order) { Fabricate(:order, state: Order::SUBMITTED) }
      let(:line_item) { Fabricate(:line_item, order: order, artwork_id: 'very-wet-painting') }
      let(:seller_id) { jwt_partner_ids.first }

      context 'with an order that is not submitted' do
        let(:order) { Fabricate(:order, state: 'pending') }

        it 'returns an error' do
          expect do
            client.execute(query, orderId: order.id, sellerId: seller_id)
          end.to raise_error do |error|
            expect(error).to be_a(Graphlient::Errors::ServerError)
            expect(error.status_code).to eq 400
            expect(error.message).to eq 'the server responded with status 400'
            expect(error.response['errors'].first['extensions']['code']).to eq 'order_not_submitted'
            expect(error.response['errors'].first['extensions']['type']).to eq 'validation'
          end
        end
      end

      context 'with an order id and seller id mismatch' do
        it 'returns an error' do
          expect do
            client.execute(query, orderId: order.id, sellerId: 'invalid')
          end.to raise_error do |error|
            expect(error).to be_a(Graphlient::Errors::ServerError)
            expect(error.status_code).to eq 404
            expect(error.message).to eq 'the server responded with status 404'
          end
        end
      end

      context 'with an order that has no competition' do
        it 'returns an empty array' do
          results = client.execute(query, orderId: order.id, sellerId: seller_id)
          expect(results.data.competing_orders.total_count).to eq 0
        end
      end

      context 'with an order that has competition and good params' do
        it 'returns those competing orders' do
          3.times do
            competing_order = Fabricate(:order, state: Order::SUBMITTED)
            Fabricate(:line_item, order: competing_order, artwork_id: line_item.artwork_id)
          end

          results = client.execute(query, orderId: order.id, sellerId: seller_id)
          expect(results.data.competing_orders.total_count).to eq 3
        end
      end
    end
  end
end

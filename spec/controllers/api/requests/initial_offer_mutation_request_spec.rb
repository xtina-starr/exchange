require 'rails_helper'
require 'support/gravity_helper'

describe Api::GraphqlController, type: :request do
  describe 'initial_offer mutation' do
    include_context 'GraphQL Client'
    let(:partner_id) { jwt_partner_ids.first }
    let(:user_id) { jwt_user_id }
    let(:mode) { Order::OFFER }
    let(:state) { Order::PENDING }
    let(:order) { Fabricate(:order, seller_id: partner_id, buyer_id: user_id, mode: mode, state: state) }
    let(:order_id) { order.id.to_s }
    let(:amount_cents) { 500 }
    let(:mutation_input) do
      {
        orderId: order_id,
        amountCents: amount_cents
      }
    end
    let(:mutation) do
      <<-GRAPHQL
        mutation($input: InitialOfferInput!) {
          initialOffer(input: $input) {
            orderOrError {
              ... on OrderWithMutationSuccess {
                order {
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
                  offers {
                    edges {
                      node {
                        id
                        amountCents
                      }
                    }
                  }
                  lastOffer {
                    id
                    amountCents
                    from {
                      ... on User {
                        id
                      }
                    }
                    creatorId
                    respondsTo {
                      id
                    }
                  }
                }
              }
              ... on OrderWithMutationFailure {
                error {
                  code
                  data
                  type
                }
              }
            }
          }
        }
      GRAPHQL
    end

    context 'with proper token' do
      it 'requires order id' do
        expect do
          client.execute(mutation, input: { amountCents: 1000000 })
        end.to raise_error do |error|
          expect(error).to be_a(Graphlient::Errors::GraphQLError)
          expect(error.message).to match(/orderId: Expected value to not be null/)
        end
      end

      it 'requires amount' do
        expect do
          client.execute(mutation, input: { orderId: order_id })
        end.to raise_error do |error|
          expect(error).to be_a(Graphlient::Errors::GraphQLError)
          expect(error.message).to match(/amountCents: Expected value to not be null/)
        end
      end

      it 'requires positive amount' do
        response = client.execute(mutation, input: { orderId: order_id, amountCents: -3 })
        expect(response.data.initial_offer.order_or_error.error.type).to eq('validation')
        expect(response.data.initial_offer.order_or_error.error.code).to eq('invalid_amount_cents')
      end

      it 'requires nonzero positive amount' do
        response = client.execute(mutation, input: { orderId: order_id, amountCents: 0 })
        expect(response.data.initial_offer.order_or_error.error.type).to eq('validation')
        expect(response.data.initial_offer.order_or_error.error.code).to eq('invalid_amount_cents')
      end

      it 'returns the order' do
        response = client.execute(mutation, input: mutation_input)
        response_order = response.data.initial_offer.order_or_error.order
        expect(response_order.id).to eq(order_id)
        expect(response_order.last_offer.amount_cents).to eq 500
        expect(response_order.last_offer.from.id).to eq user_id
        expect(response_order.last_offer.responds_to).to be_nil
        expect(response_order.last_offer.creator_id).to eq user_id
        expect(response_order.offers.edges.count).to eq 1
      end
    end
  end
end

require 'rails_helper'
require 'support/gravity_helper'

describe Api::GraphqlController, type: :request do
  describe 'buyer_offer_create mutation' do
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
        mutation($input: BuyerOfferInput!) {
          buyerOffer(input: $input) {
            objectOrError {
              ... on Order {
                id
              }
              ... on ApplicationError {
                code
                data
                type
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
        expect(response.data.buyer_offer.object_or_error.type).to eq('validation')
        expect(response.data.buyer_offer.object_or_error.code).to eq('invalid_amount_cents')
      end

      it 'requires nonzero positive amount' do
        response = client.execute(mutation, input: { orderId: order_id, amountCents: 0 })
        expect(response.data.buyer_offer.object_or_error.type).to eq('validation')
        expect(response.data.buyer_offer.object_or_error.code).to eq('invalid_amount_cents')
      end

      it 'returns the order' do
        response = client.execute(mutation, input: mutation_input)
        expect(response.data.buyer_offer.object_or_error.id).to eq(order_id)
      end
    end
  end
end

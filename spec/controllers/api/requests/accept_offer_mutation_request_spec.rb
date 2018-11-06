require 'rails_helper'
require 'support/use_stripe_mock'

describe Api::GraphqlController, type: :request do
  describe 'approve_order mutation' do
    include_context 'GraphQL Client'
    let(:partner_id) { jwt_partner_ids.first }
    let(:user_id) { jwt_user_id }
    let(:order) { Fabricate(:order, state: order_state, seller_id: partner_id, buyer_id: user_id) }
    let(:offer) { Fabricate(:offer, order: order) }
    let(:order_state) { Order::SUBMITTED }

    let(:mutation) do
      <<-GRAPHQL
        mutation($input: SellerAcceptOfferInput!) {
          sellerAcceptOffer(input: $input) {
            orderOrError {
              ... on OrderWithMutationSuccess {
                order {
                  id
                  state
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

    let(:seller_accept_offer_input) do
      {
        input: {
          offerId: offer.id.to_s
        }
      }
    end

    context 'with an invalid state transition' do
      let(:order_state) { Order::PENDING }

      it "returns invalid state transition error and doesn't change the state" do
        response = client.execute(mutation, seller_accept_offer_input)

        expect(response.data.seller_accept_offer.order_or_error.error.type).to eq 'validation'
        expect(response.data.seller_accept_offer.order_or_error.error.code).to eq 'invalid_state'
        expect(order.reload.state).to eq Order::PENDING
      end
    end

    context 'with user without permission to this partner' do
      let(:partner_id) { 'another-partner-id' }

      it 'returns permission error' do
        response = client.execute(mutation, seller_accept_offer_input)

        expect(response.data.seller_accept_offer.order_or_error.error.type).to eq 'validation'
        expect(response.data.seller_accept_offer.order_or_error.error.code).to eq 'not_found'
        expect(order.reload.state).to eq Order::SUBMITTED
      end
    end

    context 'when the specified offer does not exist' do
      let(:seller_accept_offer_input) do
        {
          input: {
            offerId: '-1'
          }
        }
      end

      it 'returns a not-found error' do
        expect { client.execute(mutation, seller_accept_offer_input) }.to raise_error do |error|
          expect(error.status_code).to eq(404)
        end
      end
    end

    context 'with proper permission' do
      it 'approves the order' do
        expect do
          client.execute(mutation, seller_accept_offer_input)
        end.to change { order.reload.state }.from(Order::SUBMITTED).to(Order::APPROVED)
      end
    end
  end
end

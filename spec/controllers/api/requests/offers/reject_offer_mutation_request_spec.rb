require 'rails_helper'
require 'support/use_stripe_mock'

RSpec.shared_examples "rejecting an offer" do
  before do
    order.update!(last_offer: offer)
  end

  context 'when not in the submitted state' do
    let(:order_state) { Order::PENDING }

    it "returns invalid state transition error and doesn't change the order state" do
      response = client.execute(mutation, input)
      expect(response.data.response.order_or_error.error.type).to eq 'validation'
      expect(response.data.response.order_or_error.error.code).to eq 'invalid_state'
      expect(order.reload.state).to eq Order::PENDING
    end
  end

  context 'when attempting to reject not the last offer' do
    it 'returns a validation error and does not change the order state' do
      create_order_and_original_offer
      create_another_offer

      response = client.execute(mutation, input)

      expect(response.data.response.order_or_error.error.type).to eq 'validation'
      expect(response.data.response.order_or_error.error.code).to eq 'not_last_offer'
      expect(order.reload.state).to eq Order::SUBMITTED
    end
  end

  context 'when the specified offer does not exist' do
    let(:input) do
      {
        input: {
          offerId: '-1',
          rejectReason: reject_reason
        }
      }
    end

    it 'returns a not-found error' do
      expect { client.execute(mutation, input) }.to raise_error do |error|
        expect(error.status_code).to eq(404)
      end
    end
  end

  context 'with proper permission' do
    it 'rejects the order' do
      expect do
        client.execute(mutation, input)
      end.to change { order.reload.state }.from(Order::SUBMITTED).to(Order::CANCELED)
    end
  end

  def create_order_and_original_offer
    order
    offer
  end

  def create_another_offer
    another_offer = Fabricate(:offer, order: order)
    order.update!(last_offer: another_offer)
  end
end

describe Api::GraphqlController, type: :request do
  include_context 'GraphQL Client'

  let(:partner_id) { jwt_partner_ids.first }
  let(:user_id) { jwt_user_id }
  let(:order_state) { Order::SUBMITTED }
  let(:reject_reason) { 'SELLER_REJECTED_OFFER_TOO_LOW' }
  let(:order) { Fabricate(:order, state: order_state, seller_id: partner_id, buyer_id: user_id, seller_type: 'gallery') }
  let(:offer) { Fabricate(:offer, order: order) }

  describe 'seller_reject_order mutation' do
    let(:seller_mutation) do
      <<-GRAPHQL
        mutation($input: SellerRejectOfferInput!) {
          response: sellerRejectOffer(input: $input) {
            orderOrError {
              ... on OrderWithMutationSuccess {
                order {
                  id
                  state
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
    let(:seller_input) do
      {
        input: {
          offerId: offer.id.to_s,
          rejectReason: reject_reason
        }
      }
    end 
    it_behaves_like "rejecting an offer" do 
      let(:mutation) { seller_mutation }
      let(:input) { seller_input }
    end

    context 'with user without permission to this partner' do
      let(:partner_id) { 'another-partner-id' } # TODO: rename to :seller_id

      it 'returns permission error' do
        response = client.execute(seller_mutation, seller_input)

        expect(response.data.response.order_or_error.error.type).to eq 'validation'
        expect(response.data.response.order_or_error.error.code).to eq 'not_found'
        expect(order.reload.state).to eq Order::SUBMITTED
      end
    end
  end
  describe 'buyer_reject_order mutation' do
    it_behaves_like 'rejecting an offer' do
      let(:mutation) do
        <<-GRAPHQL
          mutation($input: BuyerRejectOfferInput!) {
            response: buyerRejectOffer(input: $input) {
              orderOrError {
                ... on OrderWithMutationSuccess {
                  order {
                    id
                    state
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
      let(:input) do
        {
          input: {
            offerId: offer.id.to_s
          }
        }
      end
      let(:offer) { Fabricate(:offer, order: order, from_id: partner_id, from_type: 'gallery') }
    end
  end
end

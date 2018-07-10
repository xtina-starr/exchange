require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'submit_order mutation' do
    include_context 'GraphQL Client'
    let(:partner_id) { jwt_partner_ids.first }
    let(:user_id) { jwt_user_id }
    let(:credit_card_id) { 'cc-1' }
    let(:order) { Fabricate(:order, partner_id: partner_id, user_id: user_id, credit_card_id: credit_card_id, shipping_country: 'IR', shipping_type: Order::SHIP) }

    let(:mutation) do
      <<-GRAPHQL
        mutation($input: SubmitOrderInput!) {
          submitOrder(input: $input) {
            order {
              id
              userId
              partnerId
              state
            }
            errors
          }
        }
      GRAPHQL
    end

    let(:submit_order_input) do
      {
        input: {
          id: order.id.to_s
        }
      }
    end
    context 'with user without permission to this order' do
      let(:user_id) { 'random-user-id-on-another-order' }
      it 'returns permission error' do
        response = client.execute(mutation, submit_order_input)
        expect(response.data.submit_order.errors).to include 'Not permitted'
        expect(order.reload.state).to eq Order::PENDING
      end
    end

    context 'with proper permission' do
      context 'with order without shipping info' do
        before do
          order.update_attributes! shipping_country: nil
        end
        it 'returns error' do
          response = client.execute(mutation, submit_order_input)
          expect(response.data.submit_order.errors).to include "Missing info for submitting order(#{order.id})"
          expect(order.reload.state).to eq Order::PENDING
        end
      end
      context 'with order without payment info' do
        before do
          order.update_attributes! credit_card_id: nil
        end
        it 'returns error' do
          response = client.execute(mutation, submit_order_input)
          expect(response.data.submit_order.errors).to include "Missing info for submitting order(#{order.id})"
          expect(order.reload.state).to eq Order::PENDING
        end
      end
      context 'with order in non-pending state' do
        before do
          order.update_attributes! state: Order::APPROVED
        end
        it 'returns error' do
          response = client.execute(mutation, submit_order_input)
          expect(response.data.submit_order.errors).to include 'Invalid action on this approved order'
          expect(order.reload.state).to eq Order::APPROVED
        end
      end

      it 'submits the order' do
        response = client.execute(mutation, submit_order_input)
        expect(response.data.submit_order.order.id).to eq order.id.to_s
        expect(response.data.submit_order.order.state).to eq 'SUBMITTED'
        expect(response.data.submit_order.errors).to match []
        expect(order.reload.credit_card_id).to eq credit_card_id
        expect(order.state).to eq Order::SUBMITTED
        expect(order.state_updated_at).not_to be_nil
        expect(order.state_expires_at).to eq(order.state_updated_at + 2.days)
      end
    end
  end
end

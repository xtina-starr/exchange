require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'finalize_order mutation' do
    include_context 'GraphQL Client'
    let(:partner_id) { jwt_partner_ids.first }
    let(:user_id) { jwt_user_id }
    let(:credit_card_id) { 'cc-1' }
    let(:order) { Fabricate(:order, partner_id: partner_id, user_id: user_id) }

    let(:mutation) do
      <<-GRAPHQL
        mutation($input: FinalizeOrderInput!) {
          finalizeOrder(input: $input) {
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

    let(:finalize_order_input) do
      {
        input: {
          id: order.id.to_s
        }
      }
    end
    context 'with user without permission to this partner' do
      let(:partner_id) { 'another-partner-id' }
      it 'returns permission error' do
        response = client.execute(mutation, finalize_order_input)
        expect(response.data.finalize_order.errors).to include 'Not permitted'
        expect(order.reload.state).to eq Order::PENDING
      end
    end

    context 'with order not in approved state' do
      before do
        order.update_attributes! state: Order::SUBMITTED
      end
      it 'returns error' do
        response = client.execute(mutation, finalize_order_input)
        expect(response.data.finalize_order.errors).to include 'Invalid action on this submitted order'
        expect(order.reload.state).to eq Order::SUBMITTED
      end
    end

    context 'with proper permission' do
      before do
        order.update_attributes! state: Order::APPROVED
      end
      it 'finalizes the order' do
        response = client.execute(mutation, finalize_order_input)
        expect(response.data.finalize_order.order.id).to eq order.id.to_s
        expect(response.data.finalize_order.order.state).to eq 'FINALIZED'
        expect(response.data.finalize_order.errors).to match []
        expect(order.reload.state).to eq Order::FINALIZED
      end
    end
  end
end

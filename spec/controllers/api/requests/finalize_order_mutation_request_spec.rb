require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'finalize_with_one_fulfillment mutation' do
    include_context 'GraphQL Client'
    let(:partner_id) { jwt_partner_ids.first }
    let(:user_id) { jwt_user_id }
    let(:credit_card_id) { 'cc-1' }
    let(:order) { Fabricate(:order, partner_id: partner_id, user_id: user_id) }
    let!(:line_items) do
      Array.new(2) { Fabricate(:line_item, order: order, price_cents: 200) }
    end

    let(:mutation) do
      <<-GRAPHQL
        mutation($input: FinalizeWithOneFulfillmentInput!) {
          finalizeWithOneFulfillment(input: $input) {
            order {
              id
              userId
              partnerId
              state
              lineItems{
                edges{
                  node{
                    fulfillments{
                      edges{
                        node{
                          courier
                          trackingId
                          estimatedDelivery
                        }
                      }
                    }
                  }
                }
              }
            }
            errors
          }
        }
      GRAPHQL
    end

    let(:courier) { 'FedEx' }
    let(:finalize_with_one_fulfillment_input) do
      {
        input: {
          id: order.id.to_s,
          fulfillment: {
            courier: courier,
            trackingId: 'fedx-123',
            estimatedDelivery: '2018-12-15'
          }
        }
      }
    end
    context 'with user without permission to this partner' do
      let(:partner_id) { 'another-partner-id' }
      it 'returns permission error' do
        response = client.execute(mutation, finalize_with_one_fulfillment_input)
        expect(response.data.finalize_with_one_fulfillment.errors).to include 'Not permitted'
        expect(order.reload.state).to eq Order::PENDING
      end
    end

    context 'with order not in approved state' do
      before do
        order.update_attributes! state: Order::SUBMITTED
      end
      it 'returns error' do
        response = client.execute(mutation, finalize_with_one_fulfillment_input)
        expect(response.data.finalize_with_one_fulfillment.errors).to include 'Invalid action on this submitted order'
        expect(order.reload.state).to eq Order::SUBMITTED
      end
    end

    context 'with proper permission' do
      before do
        order.update_attributes! state: Order::APPROVED
      end
      it 'finalizes the order' do
        expect do
          response = client.execute(mutation, finalize_with_one_fulfillment_input)
          expect(response.data.finalize_with_one_fulfillment.order.id).to eq order.id.to_s
          expect(response.data.finalize_with_one_fulfillment.order.state).to eq 'FINALIZED'
          response.data.finalize_with_one_fulfillment.order.line_items.edges.each do |li|
            li.node.fulfillments.edges.each do |f|
              expect(f.node.courier).to eq 'FedEx'
              expect(f.node.tracking_id).to eq 'fedx-123'
              expect(f.node.estimated_delivery).to eq '2018-12-15'
            end
          end
          expect(response.data.finalize_with_one_fulfillment.errors).to match []
          expect(order.reload.state).to eq Order::FINALIZED
          order.line_items.each do |li|
            expect(li.fulfillments.count).to eq 1
            expect(li.fulfillments.first.courier).to eq 'FedEx'
            expect(li.fulfillments.first.tracking_id).to eq 'fedx-123'
            expect(li.fulfillments.first.estimated_delivery).to eq Date.strptime('2018-12-15', '%Y-%m-%d')
          end
        end.to change(Fulfillment, :count).by(2).and change(LineItemFulfillment, :count).by(2)
      end
    end
  end
end

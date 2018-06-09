require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'create_order mutation' do
    include_context 'GraphQL Client'
    let(:partner_id) { 'partner-id' }
    let(:artwork_id) { 'artwork-1' }
    let(:edition_set_id) { 'ed-1'}
    let(:line_item1) { { artworkId: artwork_id, editionSetId: edition_set_id, priceCents: 420_00 } }
    let(:line_items) { [line_item1] }
    let(:order_input_with_line_item) {
      {
        input: {
          userId: jwt_user_id,
          partnerId: partner_id,
          lineItems: line_items
        }
      }
    }
    let(:order_input_wrong_user) {
      {
        input: {
          userId: 'random-dude',
          partnerId: partner_id,
          lineItems: line_items
        }
      }
    }
    let(:mutation) {
      <<-GRAPHQL
        mutation($input: CreateOrderInput!) {
          createOrder(input: $input) {
            order {
              id
              userId
              partnerId
            }
            errors
          }
        }
      GRAPHQL
    }
    context 'with user id not matching jwt user id' do
      it 'returns error when users dont match' do
        expect do
          response = client.execute(mutation, order_input_wrong_user)
          expect(response.data.create_order.errors.first).to eq 'Not Permitted'
        end.to change(Order, :count).by(0)
      end
    end

    context 'with user id matching jwt user id' do
      it 'creates order with proper defaults' do
        expect do
          response = client.execute(mutation, order_input_with_line_item)
          expect(response.data.create_order.order.id).not_to be_nil
          expect(response.data.create_order.errors).to match []
        end.to change(Order, :count).by(1).and change(LineItem, :count).by(1)
        order = Order.last
        expect(order.currency_code).to eq 'usd'
        expect(order.user_id).to eq jwt_user_id
        expect(order.partner_id).to eq partner_id
        expect(order.line_items.count).to eq 1
        expect(order.line_items.first.price_cents).to eq 420_00
        expect(order.line_items.first.artwork_id).to eq 'artwork-1'
        expect(order.line_items.first.edition_set_id).to eq 'ed-1'
      end
    end

    context 'with existing pending order for artwork' do
      let!(:order) { Fabricate(:order, user_id: jwt_user_id) }
      let!(:line_item) { Fabricate(:line_item, order: order, artwork_id: artwork_id, edition_set_id: edition_set_id) }
      it 'returns error when creating same order' do
        expect do
          response = client.execute(mutation, order_input_with_line_item)
          expect(response.data.create_order.errors.first).to eq 'Existing pending order'
        end.to change(Order, :count).by(0)
      end
    end
  end
end

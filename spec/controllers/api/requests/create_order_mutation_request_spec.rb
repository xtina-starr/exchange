require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'create_order mutation' do
    include_context 'GraphQL Client'
    let(:partner_id) { 'partner-id' }
    let(:artwork_id) { 'artwork-1' }
    let(:edition_set_id) { 'ed-1' }
    let(:quantity) { 1 }
    let(:line_item1) { { artworkId: artwork_id, editionSetId: edition_set_id, priceCents: 420_00, quantity: quantity } }
    let(:line_items) { [line_item1] }
    let(:currency_code) { 'usd' }
    let(:order_input_with_line_item) do
      {
        input: {
          userId: jwt_user_id,
          partnerId: partner_id,
          lineItems: line_items,
          currencyCode: currency_code
        }
      }
    end
    let(:order_input_wrong_user) do
      {
        input: {
          userId: 'random-dude',
          partnerId: partner_id,
          lineItems: line_items,
          currencyCode: currency_code
        }
      }
    end
    let(:mutation) do
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
    end
    context 'with user id not matching jwt user id' do
      it 'returns error when users dont match' do
        expect do
          response = client.execute(mutation, order_input_wrong_user)
          expect(response.data.create_order.errors).to include 'Not permitted'
        end.to change(Order, :count).by(0)
      end
    end

    context 'with user id matching jwt user id' do
      it 'creates order with proper defaults' do
        expect do
          response = client.execute(mutation, order_input_with_line_item)
          expect(response.data.create_order.order.id).not_to be_nil
          expect(response.data.create_order.errors).to match []
        end.to have_enqueued_job(SetLineItemArtworkJob)
        order = Order.last
        expect(order.currency_code).to eq 'usd'
        expect(order.user_id).to eq jwt_user_id
        expect(order.partner_id).to eq partner_id
        expect(order.line_items.count).to eq 1
        expect(order.line_items.first.price_cents).to eq 420_00
        expect(order.line_items.first.artwork_id).to eq 'artwork-1'
        expect(order.line_items.first.edition_set_id).to eq 'ed-1'
        expect(order.line_items.first.quantity).to eq 1
      end

      context 'with unsupported currency code' do
        let(:currency_code) { 'ria' }
        it 'returns error' do
          expect do
            response = client.execute(mutation, order_input_with_line_item)
            expect(response.data.create_order.errors).to include 'Currency not supported'
          end.to change(Order, :count).by(0)
        end
      end

      context 'with existing pending order for artwork' do
        let!(:order) { Fabricate(:order, user_id: jwt_user_id, state: Order::PENDING) }
        it 'returns error' do
          expect do
            response = client.execute(mutation, order_input_with_line_item)
            expect(response.data.create_order.order.id).not_to be_nil
            expect(response.data.create_order.errors).to match []
            expect(order.reload.state).to eq Order::ABANDONED
          end.to change(Order, :count).by(1).and change(Order.where(state: Order::ABANDONED), :count).by(1)
        end
      end
    end
  end
end

require 'rails_helper'
require 'support/gravity_helper'

describe Api::GraphqlController, type: :request do
  describe 'create_order mutation' do
    include_context 'GraphQL Client'
    let(:artwork_id) { 'artwork-id' }
    let(:edition_set_id) { 'edition-set-id' }
    let(:partner_id) { 'gravity-partner-id' }
    let(:quantity) { 2 }
    let(:mutation_input) do
      {
        artworkId: artwork_id,
        editionSetId: edition_set_id,
        quantity: quantity
      }
    end
    let(:mutation) do
      <<-GRAPHQL
        mutation($input: CreateOrderWithArtworkInput!) {
          createOrderWithArtwork(input: $input) {
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

    context 'with proper token' do
      context 'without artworkId' do
        it 'requires artwork id' do
          expect do
            client.execute(mutation, input: { quantity: 1 })
          end.to raise_error(Graphlient::Errors::GraphQLError, /artworkId: Expected value to not be null/)
        end
      end

      context 'with failed artwork fetch' do
        before do
          expect(Adapters::GravityV1).to receive(:request).with('/artwork/artwork-id').and_raise(Adapters::GravityError.new('Timeout'))
        end
        it 'does not create order and returns proper error' do
          expect do
            response = client.execute(mutation, input: mutation_input)
            expect(response.data.create_order_with_artwork.order).to be_nil
            expect(response.data.create_order_with_artwork.errors).to match ['Unknown artwork artwork-id']
          end.to change(Order, :count).by(0).and change(LineItem, :count).by(0)
        end
      end

      context 'with successful artwork fetch' do
        before do
          expect(Adapters::GravityV1).to receive(:request).with('/artwork/artwork-id').and_return(gravity_v1_artwork)
        end
        context 'without editionSetId' do
          it 'creates order with artwork price' do
            expect do
              response = client.execute(mutation, input: mutation_input.except(:editionSetId))
              expect(response.data.create_order_with_artwork.order.id).not_to be_nil
              expect(response.data.create_order_with_artwork.errors).to match []
              order = Order.find(response.data.create_order_with_artwork.order.id)
              expect(order.currency_code).to eq 'USD'
              expect(order.user_id).to eq jwt_user_id
              expect(order.partner_id).to eq partner_id
              expect(order.line_items.count).to eq 1
              expect(order.line_items.first.price_cents).to eq 540_012
              expect(order.line_items.first.artwork_id).to eq 'artwork-id'
              expect(order.line_items.first.edition_set_id).to be_nil
              expect(order.line_items.first.quantity).to eq 2
            end.to change(Order, :count).by(1).and change(LineItem, :count).by(1)
          end
        end

        context 'with editionSetId' do
          it 'creates order with edition_set price' do
            expect do
              response = client.execute(mutation, input: mutation_input)
              expect(response.data.create_order_with_artwork.order.id).not_to be_nil
              expect(response.data.create_order_with_artwork.errors).to match []
              order = Order.find(response.data.create_order_with_artwork.order.id)
              expect(order.currency_code).to eq 'USD'
              expect(order.user_id).to eq jwt_user_id
              expect(order.partner_id).to eq partner_id
              expect(order.line_items.count).to eq 1
              expect(order.line_items.first.price_cents).to eq 420_042
              expect(order.line_items.first.artwork_id).to eq 'artwork-id'
              expect(order.line_items.first.edition_set_id).to eq 'edition-set-id'
              expect(order.line_items.first.quantity).to eq 2
            end.to change(Order, :count).by(1).and change(LineItem, :count).by(1)
          end
        end

        context 'without quantity' do
          it 'defaults to 1' do
            expect do
              response = client.execute(mutation, input: { artworkId: artwork_id })
              expect(response.data.create_order_with_artwork.order.id).not_to be_nil
              expect(response.data.create_order_with_artwork.errors).to match []
              order = Order.find(response.data.create_order_with_artwork.order.id)
              expect(order.currency_code).to eq 'USD'
              expect(order.user_id).to eq jwt_user_id
              expect(order.partner_id).to eq partner_id
              expect(order.line_items.count).to eq 1
              expect(order.line_items.first.price_cents).to eq 540_012
              expect(order.line_items.first.artwork_id).to eq 'artwork-id'
              expect(order.line_items.first.edition_set_id).to be_nil
              expect(order.line_items.first.quantity).to eq 1
            end.to change(Order, :count).by(1).and change(LineItem, :count).by(1)
          end
        end

        context 'with existing pending order for artwork' do
          let!(:order) do
            order = Fabricate(:order, user_id: jwt_user_id, state: Order::PENDING)
            order.line_items = [Fabricate(:line_item, artwork_id: artwork_id)]
            order
          end
          it 'creates a new order' do
            expect do
              response = client.execute(mutation, input: mutation_input)
              expect(response.data.create_order_with_artwork.order.id).not_to be_nil
              expect(response.data.create_order_with_artwork.errors).to match []
              expect(order.reload.state).to eq Order::PENDING
            end.to change(Order, :count).by(1)
          end
        end
      end
    end
  end
end

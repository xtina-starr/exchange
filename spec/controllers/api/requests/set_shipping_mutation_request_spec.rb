require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'set_shipping mutation' do
    include_context 'GraphQL Client'
    let(:partner_id) { jwt_partner_ids.first }
    let(:user_id) { jwt_user_id }
    let(:order) { Fabricate(:order, partner_id: partner_id, user_id: user_id) }

    let(:mutation) do
      <<-GRAPHQL
        mutation($input: SetShippingInput!) {
          setShipping(input: $input) {
            order {
              id
              userId
              partnerId
              state
              fulfillmentType
            }
            errors
          }
        }
      GRAPHQL
    end

    let(:set_shipping_input) do
      {
        input: {
          id: order.id.to_s,
          fulfillmentType: 'SHIP',
          shippingCountry: 'IR',
          shippingCity: 'Tehran',
          shippingPostalCode: '02198912',
          shippingAddressLine1: 'Vanak',
          shippingAddressLine2: 'P 80'
        }
      }
    end
    context 'with user without permission to this order' do
      let(:user_id) { 'random-user-id-on-another-order' }
      it 'returns permission error' do
        response = client.execute(mutation, set_shipping_input)
        expect(response.data.set_shipping.errors).to include 'Not permitted'
        expect(order.reload.state).to eq Order::PENDING
      end
    end

    context 'with proper permission' do
      context 'with order in non-pending state' do
        before do
          order.update! state: Order::APPROVED
        end
        it 'returns error' do
          response = client.execute(mutation, set_shipping_input)
          expect(response.data.set_shipping.errors).to include 'Cannot set shipping info on non-pending orders'
          expect(order.reload.state).to eq Order::APPROVED
        end
      end

      it 'sets shipping info on the order' do
        response = client.execute(mutation, set_shipping_input)
        expect(response.data.set_shipping.order.id).to eq order.id.to_s
        expect(response.data.set_shipping.order.state).to eq 'PENDING'
        expect(response.data.set_shipping.errors).to match []
        expect(order.reload.fulfillment_type).to eq Order::SHIP
        expect(order.state).to eq Order::PENDING
        expect(order.shipping_country).to eq 'IR'
        expect(order.shipping_city).to eq 'Tehran'
        expect(order.shipping_postal_code).to eq '02198912'
        expect(order.shipping_address_line1).to eq 'Vanak'
        expect(order.shipping_address_line2).to eq 'P 80'
        expect(order.state_expires_at).to eq(order.state_updated_at + 2.days)
      end
    end
  end
end

require 'rails_helper'
require 'support/gravity_helper'
require 'support/taxjar_helper'

describe Api::GraphqlController, type: :request do
  describe 'set_shipping mutation' do
    include_context 'GraphQL Client'
    let(:seller_id) { jwt_partner_ids.first }
    let(:user_id) { jwt_user_id }
    let(:order) { Fabricate(:order, seller_id: seller_id, buyer_id: user_id) }
    let!(:line_items) { [Fabricate(:line_item, order: order, artwork_id: 'a-1', list_price_cents: 1000_00, quantity: 1)] }
    let(:artwork) { gravity_v1_artwork(_id: 'a-1', domestic_shipping_fee_cents: 200_00, international_shipping_fee_cents: 300_00) }
    let(:partner) { { id: seller_id, artsy_collects_sales_tax: true, billing_location_id: '123abc' } }
    let(:seller_addresses) { [Address.new(state: 'NY', country: 'US', postal_code: '10001'), Address.new(state: 'MA', country: 'US', postal_code: '02139')] }

    let(:mutation) do
      <<-GRAPHQL
        mutation($input: SetShippingInput!) {
          setShipping(input: $input) {
            orderOrError {
              ... on OrderWithMutationSuccess {
                order {
                  id
                  state
                  shippingTotalCents
                  requestedFulfillment {
                    __typename
                    ... on Ship {
                      addressLine1
                    }
                    ... on Pickup {
                      fulfillmentType
                    }
                  }
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
    let(:us_shipping_address) do
      {
        name: 'Fname Lname',
        country: 'US',
        city: 'New York',
        region: 'NY',
        postalCode: '10012',
        phoneNumber: '617-718-7818',
        addressLine1: '401 Broadway',
        addressLine2: 'Suite 80'
      }
    end
    let(:international_shipping_address) do
      {
        name: 'NameF NameL',
        country: 'IR',
        city: 'Tehran',
        region: 'TH',
        postalCode: '09821',
        phoneNumber: '0989121324',
        addressLine1: 'Vanak',
        addressLine2: 'Suite 81'
      }
    end
    let(:set_shipping_input) do
      {
        input: {
          id: order.id.to_s,
          fulfillmentType: fulfillment_type,
          shipping: shipping_address
        }.compact
      }
    end

    before do
      stub_tax_for_order
      allow(Adapters::GravityV1).to receive(:get).with('/artwork/a-1').and_return(artwork)
      allow(Gravity).to receive_messages(
        fetch_partner_locations: seller_addresses,
        fetch_partner: partner
      )
    end

    describe 'switch from domestic to international shipping' do
      before do
        # set shipping to domestic
        client.execute(mutation, input: { id: order.id.to_s, fulfillmentType: 'SHIP', shipping: us_shipping_address })
        expect(order.reload.shipping_country).to eq 'US'
        expect(order.shipping_city).to eq 'New York'
        expect(order.shipping_region).to eq 'NY'
        expect(order.shipping_postal_code).to eq '10012'
        expect(order.buyer_phone_number).to eq '617-718-7818'
        expect(order.shipping_name).to eq 'Fname Lname'
        expect(order.shipping_address_line1).to eq '401 Broadway'
        expect(order.shipping_address_line2).to eq 'Suite 80'
        expect(order.shipping_total_cents).to eq 200_00
        expect(order.buyer_total_cents).to eq 1201_16
        @response = client.execute(mutation, input: { id: order.id.to_s, fulfillmentType: 'SHIP', shipping: international_shipping_address })
      end
      it 'changes shipping info' do
        expect(order.reload.shipping_country).to eq 'IR'
        expect(order.shipping_city).to eq 'Tehran'
        expect(order.shipping_region).to eq 'TH'
        expect(order.shipping_postal_code).to eq '09821'
        expect(order.buyer_phone_number).to eq '0989121324'
        expect(order.shipping_name).to eq 'NameF NameL'
        expect(order.shipping_address_line1).to eq 'Vanak'
        expect(order.shipping_address_line2).to eq 'Suite 81'
      end
      it 'updates order totals' do
        expect(order.reload.shipping_total_cents).to eq 300_00
        expect(order.buyer_total_cents).to eq 1301_16
      end
    end

    describe 'switch from ship to pickup' do
      before do
        # set shipping to domestic
        client.execute(mutation, input: { id: order.id.to_s, fulfillmentType: 'SHIP', shipping: us_shipping_address })
        expect(order.reload.shipping_country).to eq 'US'
        expect(order.shipping_city).to eq 'New York'
        expect(order.shipping_region).to eq 'NY'
        expect(order.shipping_postal_code).to eq '10012'
        expect(order.buyer_phone_number).to eq '617-718-7818'
        expect(order.shipping_name).to eq 'Fname Lname'
        expect(order.shipping_address_line1).to eq '401 Broadway'
        expect(order.shipping_address_line2).to eq 'Suite 80'
        expect(order.shipping_total_cents).to eq 200_00
        expect(order.buyer_total_cents).to eq 1201_16
        @response = client.execute(mutation, input: { id: order.id.to_s, fulfillmentType: 'PICKUP' })
      end
      it 'changes shipping info' do
        expect(order.reload.fulfillment_type).to eq Order::PICKUP
        expect(order.shipping_country).to eq nil
        expect(order.shipping_city).to eq nil
        expect(order.shipping_region).to eq nil
        expect(order.shipping_postal_code).to eq nil
        expect(order.buyer_phone_number).to eq nil
        expect(order.shipping_name).to eq nil
        expect(order.shipping_address_line1).to eq nil
        expect(order.shipping_address_line2).to eq nil
      end
      it 'updates order totals' do
        expect(order.reload.shipping_total_cents).to eq 0
        expect(order.buyer_total_cents).to eq 1001_16
      end
    end
  end
end

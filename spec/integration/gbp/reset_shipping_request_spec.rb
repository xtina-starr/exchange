require 'rails_helper'
require 'support/gravity_helper'
require 'support/taxjar_helper'

describe Api::GraphqlController, type: :request do
  describe 'set_shipping mutation' do
    include_context 'GraphQL Client'
    let(:seller_id) { jwt_partner_ids.first }
    let(:user_id) { jwt_user_id }
    let(:order) { Fabricate(:order, seller_id: seller_id, buyer_id: user_id, currency_code: 'GBP') }
    let!(:line_items) { [Fabricate(:line_item, order: order, artwork_id: 'a-1', list_price_cents: 1000_00, quantity: 1)] }
    let(:artwork) do
      gravity_v1_artwork(_id: 'a-1', price_currency: 'GBP', domestic_shipping_fee_cents: 200_00, international_shipping_fee_cents: 300_00, location: { country: 'GB',
                                                                                                                                                       city: 'London',
                                                                                                                                                       address: '1 Fake St.',
                                                                                                                                                       postal_code: 'AB1 2CD' })
    end
    let(:partner) { { id: seller_id, artsy_collects_sales_tax: true, billing_location_id: '123abc' } }
    let(:seller_addresses) { [Address.new(city: 'London', country: 'GB', postal_code: 'SW3 4RY')] }

    let(:domestic_shipping_address) do
      {
        name: 'Fname Lname',
        country: 'GB',
        city: 'Manchester',
        region: '',
        postalCode: 'EF3 4GH',
        phoneNumber: '+44 12 3456 7890',
        addressLine1: '1 Test Rd.'
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
      allow(Gravity).to receive_messages(
        fetch_partner_locations: seller_addresses,
        fetch_partner: partner,
        get_artwork: artwork
      )
    end

    describe 'switch from domestic to international shipping' do
      before do
        # set shipping to domestic
        client.execute(QueryHelper::SET_SHIPPING, input: { id: order.id.to_s, fulfillmentType: 'SHIP', shipping: domestic_shipping_address })
        expect(order.reload).to have_attributes(
          shipping_country: 'GB',
          shipping_city: 'Manchester',
          shipping_region: '',
          shipping_postal_code: 'EF3 4GH',
          buyer_phone_number: '+44 12 3456 7890',
          shipping_name: 'Fname Lname',
          shipping_address_line1: '1 Test Rd.',
          shipping_address_line2: nil,
          shipping_total_cents: 200_00,
          buyer_total_cents: 1200_00,
          currency_code: 'GBP'
        )
        @response = client.execute(QueryHelper::SET_SHIPPING, input: { id: order.id.to_s, fulfillmentType: 'SHIP', shipping: international_shipping_address })
      end
      it 'changes shipping info' do
        expect(order.reload).to have_attributes(
          shipping_country: 'IR',
          shipping_city: 'Tehran',
          shipping_region: 'TH',
          shipping_postal_code: '09821',
          buyer_phone_number: '0989121324',
          shipping_name: 'NameF NameL',
          shipping_address_line1: 'Vanak',
          shipping_address_line2: 'Suite 81'
        )
      end
      it 'updates order totals' do
        expect(order.reload).to have_attributes(shipping_total_cents: 300_00, buyer_total_cents: 1300_00, currency_code: 'GBP')
      end
    end

    describe 'switch from ship to pickup' do
      before do
        # set shipping to domestic
        client.execute(QueryHelper::SET_SHIPPING, input: { id: order.id.to_s, fulfillmentType: 'SHIP', shipping: domestic_shipping_address })
        expect(order.reload).to have_attributes(
          shipping_country: 'GB',
          shipping_city: 'Manchester',
          shipping_region: '',
          shipping_postal_code: 'EF3 4GH',
          buyer_phone_number: '+44 12 3456 7890',
          shipping_name: 'Fname Lname',
          shipping_address_line1: '1 Test Rd.',
          shipping_address_line2: nil,
          shipping_total_cents: 200_00,
          buyer_total_cents: 1200_00,
          currency_code: 'GBP'
        )
        @response = client.execute(QueryHelper::SET_SHIPPING, input: { id: order.id.to_s, fulfillmentType: 'PICKUP', phoneNumber: '9876765432' })
      end
      it 'changes shipping info' do
        expect(order.reload).to have_attributes(
          fulfillment_type: Order::PICKUP,
          shipping_country: nil,
          shipping_city: nil,
          shipping_region: nil,
          shipping_postal_code: nil,
          buyer_phone_number: '9876765432',
          shipping_name: nil,
          shipping_address_line1: nil,
          shipping_address_line2: nil
        )
      end
      it 'updates order totals' do
        expect(order.reload).to have_attributes(shipping_total_cents: 0, buyer_total_cents: 1000_00, currency_code: 'GBP')
      end
    end
  end
end

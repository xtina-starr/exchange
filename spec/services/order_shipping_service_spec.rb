require 'rails_helper'
require 'support/gravity_helper'

describe OrderShippingService, type: :services do
  let(:order) { Fabricate(:order) }
  let(:continental_us_order) { Fabricate(:order) }
  let!(:line_item) { Fabricate(:line_item, order: order, artwork_id: 'a-1') }
  let!(:continental_us_line_item) { Fabricate(:line_item, order: continental_us_order, artwork_id: 'a-2') }
  let(:domestic_shipping) do
    {
      address_line1: '401 Broadway',
      country: 'US',
      city: 'New York',
      region: 'NY',
      postal_code: '10013'
    }
  end
  let(:non_continental_us_shipping) do
    {
      address_line1: '3101 A St',
      country: 'US',
      city: 'Anchorage',
      region: 'AK',
      postal_code: '99503'
    }
  end
  let(:international_shipping) do
    {
      address_line1: "14 Gower's Walk",
      address_line2: 'Suite 2.5, The Loom',
      city: 'Whitechapel',
      region: 'London',
      postal_code: 'E1 8PY',
      country: 'GB'
    }
  end
  let(:domestic_artwork_config) do
    {
      _id: 'a-1',
      domestic_shipping_fee_cents: 100_00,
      international_shipping_fee_cents: 500_00,
      location: artwork_location
    }
  end
  let(:continental_us_artwork_config) do
    {
      _id: 'a-2',
      domestic_shipping_fee_cents: 100_00,
      international_shipping_fee_cents: nil,
      location: artwork_location
    }
  end
  let(:artwork_location) do
    {
      country: 'US',
      city: 'Brooklyn',
      state: 'NY'
    }
  end
  let(:artwork) { gravity_v1_artwork(domestic_artwork_config) }
  let(:continental_us_artwork) { gravity_v1_artwork(continental_us_artwork_config) }

  before do
    @service_domestic_shipping = OrderShippingService.new(order, fulfillment_type: Order::SHIP, shipping: domestic_shipping)
    @service_international_shipping = OrderShippingService.new(order, fulfillment_type: Order::SHIP, shipping: international_shipping)
    @service_continental_us_shipping = OrderShippingService.new(continental_us_order, fulfillment_type: Order::SHIP, shipping: non_continental_us_shipping)
  end

  describe '#process!' do
    context 'with domestic only shipping' do
      context 'with non-continental US shipping address' do
        it 'raises error' do
          allow(@service_continental_us_shipping).to receive(:artworks).and_return('a-2' => continental_us_artwork)
          expect { @service_continental_us_shipping.process! }.to raise_error do |error|
            expect(error).to be_a(Errors::ValidationError)
            expect(error.code).to eq(:unsupported_shipping_location)
            expect(error.data[:failure_code]).to eq :domestic_shipping_only
          end
        end
      end
      context 'with international shipping address' do
        it 'raises error' do
          allow(@service_international_shipping).to receive(:artworks).and_return('a-1' => continental_us_artwork)
          expect { @service_international_shipping.process! }.to raise_error do |error|
            expect(error).to be_a(Errors::ValidationError)
            expect(error.code).to eq(:unsupported_shipping_location)
            expect(error.data[:failure_code]).to eq :domestic_shipping_only
          end
        end
      end
    end
  end

  describe '#artwork_shipping_fee' do
    context 'with pickup fulfillment type' do
      it 'returns 0' do
        service = OrderShippingService.new(order, fulfillment_type: Order::PICKUP, shipping: {})
        expect(service.send(:artwork_shipping_fee, artwork)).to eq 0
      end
    end
    context 'with domestic address' do
      it 'returns domestic cost' do
        expect(@service_domestic_shipping.send(:artwork_shipping_fee, artwork)).to eq 100_00
      end
    end
    context 'with international address' do
      it 'returns international cost' do
        expect(@service_international_shipping.send(:artwork_shipping_fee, artwork)).to eq 500_00
      end
    end
  end

  describe '#domestic_shipping?' do
    it 'returns true for artworks in the same country as shipping' do
      expect(@service_domestic_shipping.send(:domestic_shipping?, artwork[:location])).to be true
    end

    it 'returns false for artworks not in the same country as shipping' do
      expect(@service_international_shipping.send(:domestic_shipping?, artwork[:location])).to be false
    end
  end

  describe '#calculate_domestic_shipping_fee' do
    it 'returns domestic shipping cost' do
      expect(@service_domestic_shipping.send(:calculate_domestic_shipping_fee, artwork)).to eq 100_00
    end

    context 'with nil domestic shipping' do
      it 'raises error' do
        artwork[:domestic_shipping_fee_cents] = nil
        expect { @service_domestic_shipping.send(:calculate_domestic_shipping_fee, artwork) }.to raise_error do |error|
          expect(error).to be_a(Errors::ValidationError)
          expect(error.code).to eq :missing_domestic_shipping_fee
        end
      end
    end
  end

  describe '#calculate_international_shipping_fee' do
    it 'returns international shipping cost' do
      expect(@service_domestic_shipping.send(:calculate_international_shipping_fee, artwork)).to eq 500_00
    end
    context 'with nil domestic shipping' do
      it 'raises error' do
        artwork[:international_shipping_fee_cents] = nil
        expect { @service_domestic_shipping.send(:calculate_international_shipping_fee, artwork) }.to raise_error do |error|
          expect(error).to be_a(Errors::ValidationError)
          expect(error.code).to eq :missing_international_shipping_fee
        end
      end
    end
  end
end

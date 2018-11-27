require 'rails_helper'
require 'support/gravity_helper'

describe ShippingCalculatorService, type: :services do
  let(:domestic_shipping) do
    Address.new(
      street_line1: '401 Broadway',
      country: 'US',
      city: 'New York',
      region: 'NY',
      postal_code: '10013'
    )
  end
  let(:non_continental_us_shipping) do
    Address.new(
      street_line1: '3101 A St',
      country: 'US',
      city: 'Anchorage',
      region: 'AK',
      postal_code: '99503'
    )
  end
  let(:international_shipping) do
    Address.new(
      street_line1: "14 Gower's Walk",
      street_line2: 'Suite 2.5, The Loom',
      city: 'Whitechapel',
      region: 'London',
      postal_code: 'E1 8PY',
      country: 'GB'
    )
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

  let(:service_domestic_shipping) { ShippingCalculatorService.new(artwork, Order::SHIP, domestic_shipping) }
  let(:service_international_shipping) { ShippingCalculatorService.new(artwork, Order::SHIP, international_shipping) }
  let(:service_continental_us_shipping) { ShippingCalculatorService.new(continental_us_artwork, Order::SHIP, non_continental_us_shipping) }
  let(:service_pickup) { ShippingCalculatorService.new(artwork, Order::PICKUP) }

  describe '#artwork_shipping_fee' do
    context 'with pickup fulfillment type' do
      it 'returns 0' do
        expect(service_pickup.shipping_cents).to eq 0
      end
    end
    context 'with domestic address' do
      it 'returns domestic cost' do
        expect(service_domestic_shipping.shipping_cents).to eq 100_00
      end
      context 'with nil domestic shipping' do
        it 'raises error' do
          artwork[:domestic_shipping_fee_cents] = nil
          expect { service_domestic_shipping.shipping_cents }.to raise_error do |error|
            expect(error).to be_a(Errors::ValidationError)
            expect(error.code).to eq :missing_domestic_shipping_fee
          end
        end
      end
    end
    context 'with international address' do
      it 'returns international cost' do
        expect(service_international_shipping.shipping_cents).to eq 500_00
      end
      context 'with nil domestic shipping' do
        it 'raises error' do
          artwork[:international_shipping_fee_cents] = nil
          expect { service_international_shipping.shipping_cents }.to raise_error do |error|
            expect(error).to be_a(Errors::ValidationError)
            expect(error.code).to eq :unsupported_shipping_location
          end
        end
      end
    end
  end

  describe '#domestic_shipping?' do
    it 'returns true for artworks in the same country as shipping' do
      expect(service_domestic_shipping.send(:domestic_shipping?)).to be true
    end

    it 'returns false for artworks not in the same country as shipping' do
      expect(service_international_shipping.send(:domestic_shipping?)).to be false
    end
  end
end

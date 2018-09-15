require 'rails_helper'
require 'support/gravity_helper'

describe OrderShippingService, type: :services do
  let(:order) { Fabricate(:order) }
  let!(:line_item) { Fabricate(:line_item, order: order, artwork_id: 'a-1') }
  let(:domestic_shipping) do
    {
      address_line1: '401 Broadway',
      country: 'US',
      city: 'New York',
      region: 'NY',
      postal_code: '10013'
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
  let(:artwork_location) do
    {
      country: 'US',
      city: 'Brooklyn',
      state: 'NY'
    }
  end
  let(:artwork) { gravity_v1_artwork(domestic_artwork_config) }

  before do
    @service_domestic_shipping = OrderShippingService.new(order, fulfillment_type: Order::SHIP, shipping: domestic_shipping)
    @service_international_shipping = OrderShippingService.new(order, fulfillment_type: Order::SHIP, shipping: international_shipping)
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

  describe '#domestic?' do
    it 'returns true for artworks in the same country as shipping' do
      expect(@service_domestic_shipping.send(:domestic?, artwork[:location])).to be true
    end

    it 'returns false for artworks not in the same country as shipping' do
      expect(@service_international_shipping.send(:domestic?, artwork[:location])).to be false
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

  describe '#tax_total_cents' do
    context 'with an invalid artwork location' do
      it 'rescues AddressError and raises ValidationError with a code of invalid_artwork_address' do
        artwork[:region] = 'Floridada'
        allow(GravityService).to receive(:get_artwork).and_return(artwork)
        expect { @service_domestic_shipping.send(:tax_total_cents) }.to raise_error do |error|
          expect(error).to be_a Errors::ValidationError
          expect(error.code).to eq :invalid_artwork_address
        end
      end
    end
  end
end

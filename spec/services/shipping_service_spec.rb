require 'rails_helper'
require 'support/gravity_helper'

describe ShippingService, type: :services do
  let(:artwork_location) do
    {
      country: 'US',
      city: 'Brooklyn',
      state: 'NY'
    }
  end
  let(:free_shipping) { false }
  let(:artwork_shipping_setting) do
    {
      free_shipping: free_shipping,
      domestic_shipping_fee_cents: 100_00,
      international_shipping_fee_cents: 500_00,
      location: artwork_location
    }
  end
  let(:artwork) { gravity_v1_artwork(artwork_shipping_setting) }
  describe '#calculate_shipping' do
    let(:line_item) { Fabricate(:line_item, artwork_id: 'gravity-id') }
    context 'with successful artwork fetch call' do
      before do
        allow(Adapters::GravityV1).to receive(:request).with('/artwork/gravity-id?include_deleted=true').and_return(artwork)
      end
      context 'with pickup fulfillment type' do
        it 'returns 0' do
          expect(ShippingService.calculate_shipping(line_item, fulfillment_type: Order::PICKUP, shipping_country: 'US')).to eq 0
        end
      end
      context 'with free shipping' do
        let(:free_shipping) { true }
        it 'returns 0' do
          expect(ShippingService.calculate_shipping(line_item, fulfillment_type: Order::SHIP, shipping_country: 'US')).to eq 0
        end
      end
      context 'with domestic address' do
        it 'returns domestic cost' do
          expect(ShippingService.calculate_shipping(line_item, fulfillment_type: Order::SHIP, shipping_country: 'US')).to eq 100_00
        end
      end
      context 'with internaitonal address' do
        it 'returns international cost' do
          expect(ShippingService.calculate_shipping(line_item, fulfillment_type: Order::SHIP, shipping_country: 'Iran')).to eq 500_00
        end
      end
    end

    context 'with failed artwork fetch call' do
      before do
        allow(Adapters::GravityV1).to receive(:request).with('/artwork/gravity-id?include_deleted=true').and_raise(Adapters::GravityError.new('unknown artwork'))
      end
      it 'raises Errors::OrderError' do
        expect do
          expect(ShippingService.calculate_shipping(line_item, fulfillment_type: Order::SHIP, shipping_country: 'US'))
        end.to raise_error(Errors::OrderError, 'Cannot caclulate shipping, unknown artwork')
      end
    end
  end

  describe '#free_shipping?' do
    context 'without free shipping' do
      it 'returns false' do
        expect(ShippingService.free_shipping?(artwork)).to eq false
      end
    end
    context 'with free shipping' do
      let(:free_shipping) { true }
      it 'returns true' do
        expect(ShippingService.free_shipping?(artwork)).to eq true
      end
    end
  end

  describe '#domestic?' do
    it 'returns true for artworks in the same country as shipping' do
      expect(ShippingService.domestic?(artwork_location, 'US')).to be true
    end

    it 'returns false for artworks not in the same country as shipping' do
      expect(ShippingService.domestic?(artwork_location, 'IR')).to be false
    end
  end

  describe '#calculate_domestic' do
    it 'returns domestic shipping cost' do
      expect(ShippingService.calculate_domestic(artwork)).to eq 100_00
    end
  end

  describe '#calculate_international' do
    it 'returns international shipping cost' do
      expect(ShippingService.calculate_international(artwork)).to eq 500_00
    end
  end
end

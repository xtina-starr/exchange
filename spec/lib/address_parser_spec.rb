require 'rails_helper'

describe AddressParser do
  let(:address) do
    {
      country: 'USA',
      region: 'Florida'
    }
  end
  describe '#parse' do
    it 'returns the address with Carmen country code' do
      expect(AddressParser.parse(address)[:country]).to eq 'US'
    end
    context 'with a US or CA address' do
      it 'returns the address with the Carmen region code' do
        expect(AddressParser.parse(address)[:region]).to eq 'FL'
      end
    end
  end
  describe '#parse_region' do
    context 'with a country that is not US or CA' do
      it 'returns the region unmodified' do
        australia = Carmen::Country.coded('AU')
        expect(AddressParser.parse_region(australia, 'Northern Territory')).to eq 'Northern Territory'
      end
    end
    context 'with a country that is US or CA' do
      let(:united_states) { Carmen::Country.coded('US') }
      it 'returns the region code if the country is US or CA' do
        canada = Carmen::Country.coded('CA')
        expect(AddressParser.parse_region(united_states, 'Florida')).to eq 'FL'
        expect(AddressParser.parse_region(united_states, 'FL')).to eq 'FL'
        expect(AddressParser.parse_region(canada, 'Quebec')).to eq 'QC'
        expect(AddressParser.parse_region(canada, 'QC')).to eq 'QC'
      end
      it 'returns nil if the region is not found' do
        expect(AddressParser.parse_region(united_states, 'Floridada')).to be_nil
      end
    end
  end
end

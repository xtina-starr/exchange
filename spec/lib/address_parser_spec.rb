require 'rails_helper'

describe AddressParser do
  describe '#parse!' do
    it 'raises an error if it cannot parse a US or CA region' do
      expect do
        AddressParser.parse!({country: 'US', region: 'Floridada'})
      end.to raise_error(Errors::ApplicationError, 'Could not identify shipping region')
    end
  end
  describe '#parse_region' do
    context 'with a country that is not US or CA' do
      it 'returns the region unmodified' do
        expect(AddressParser.parse_region('AU', 'Northern Territory')).to eq 'Northern Territory'
      end
    end
    context 'with a country that is US or CA' do
      it 'returns the region code if the country is US or CA' do
        expect(AddressParser.parse_region('US', 'Florida')).to eq 'FL'
        expect(AddressParser.parse_region('US', 'FL')).to eq 'FL'
        expect(AddressParser.parse_region('CA', 'Quebec')).to eq 'QC'
        expect(AddressParser.parse_region('CA', 'QC')).to eq 'QC'
      end
      it 'returns nil if the region is not found' do
        expect(AddressParser.parse_region('US', 'Floridada')).to be_nil
      end
    end
  end
end

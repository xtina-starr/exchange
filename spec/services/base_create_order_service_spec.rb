require 'rails_helper'
require 'support/gravity_helper'

describe BaseCreateOrderService, type: :services do
  describe '#process!' do
    let(:user_id) { 'user-id' }
    let(:artwork) { gravity_v1_artwork }
    let(:artwork) { gravity_v1_artwork(edition_sets: nil) }
    let(:service) { BaseCreateOrderService.new(user_id: user_id, artwork_id: 'artwork-id', edition_set_id: nil, quantity: 2, mode: Order::BUY) }
    context 'known artwork' do
      before do
        expect(Adapters::GravityV1).to receive(:get).and_return(artwork)
      end
      it 'raises NotImplementedError' do
        expect { service.process! }.to raise_error(NotImplementedError)
      end
    end
  end
end

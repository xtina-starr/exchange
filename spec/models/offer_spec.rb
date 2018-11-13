require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe 'last_offer?' do
    it "returns true if the offer is the order's last offer" do
      order = Fabricate(:order)
      offer = Fabricate(:offer, order: order)
      order.update!(last_offer: offer)

      expect(offer.last_offer?).to eq(true)
    end

    it "return false if the offer is not the order's last offer" do
      order = Fabricate(:order)
      first_offer = Fabricate(:offer, order: order)
      second_offer = Fabricate(:offer, order: order)

      order.update!(last_offer: second_offer)

      expect(first_offer.last_offer?).to eq(false)
    end
  end

  describe '#scopes' do
    describe 'submitted' do
      let!(:offer1) { Fabricate(:offer, submitted_at: Time.now) }
      let!(:offer2) { Fabricate(:offer, submitted_at: nil) }
      let!(:offer3) { Fabricate(:offer, submitted_at: nil) }
      it 'returns submitted offers' do
        expect(Offer.submitted).to match_array [offer1]
      end
    end
  end
end

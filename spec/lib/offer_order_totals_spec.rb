require 'rails_helper'
require 'support/gravity_helper'

describe OfferOrderTotals do
  let(:fulfillment_type) { Order::PICKUP }
  let(:gravity_artwork) { gravity_v1_artwork(_id: 'a-1', price_listed: 1000.00, edition_sets: [], domestic_shipping_fee_cents: 200_00, international_shipping_fee_cents: 300_00) }
  let(:order) { Fabricate(:order, seller_id: 'partner-1', seller_type: 'gallery', buyer_id: 'buyer1', buyer_type: Order::USER, fulfillment_type: fulfillment_type) }
  let(:offer) { Fabricate(:offer, order: order, from_id: 'partner-1', from_type: 'gallery', amount_cents: 800_00, shipping_total_cents: 0, tax_total_cents: 300_00) }
  let(:line_item) { Fabricate(:line_item, order: order, artwork_id: 'a-1') }

  before do
    allow(Adapters::GravityV1).to receive(:get).with('/artwork/a-1').and_return(gravity_artwork)
    allow(Adapters::GravityV1).to receive(:get).with('/partner/partner-1/all').and_return(gravity_v1_partner)
  end

  describe 'commission_fee_cents' do
    context 'no exemption' do
      it 'returns commission based on offer and commission rate' do
        offer_order_totals = OfferOrderTotals.new(offer, commission_exemption_amount_cents: nil)
        # Commission rate: 80%, offer: 800, commission: .8 x 800 = 640
        expect(offer_order_totals.commission_fee_cents).to eq 640_00
      end
    end

    context 'exemption is 0' do
      it 'returns commission based on offer and commission rate' do
        offer_order_totals = OfferOrderTotals.new(offer, commission_exemption_amount_cents: 0)
        # Commission rate: 80%, offer: 800, commission: .8 x 800 = 640
        expect(offer_order_totals.commission_fee_cents).to eq 640_00
      end
    end

    context 'exemption is > 0' do
      it 'returns commission including exemption' do
        offer_order_totals = OfferOrderTotals.new(offer, commission_exemption_amount_cents: 100_00)
        # Commission rate: 80%, offer: 800, exemption: 100, commission: .8 x (800 - 100) = 560
        expect(offer_order_totals.commission_fee_cents).to eq 560_00
      end
    end
  end
end

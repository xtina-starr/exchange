require 'rails_helper'
require 'support/gravity_helper'

describe LineItemTotals do
  let(:fulfillment_type) { Order::PICKUP }
  let(:shipping_address) { nil }
  let(:seller_locations) { [] }
  let(:order) { Fabricate(:order, seller_id: 'partner-1', seller_type: 'gallery', buyer_id: 'buyer1', buyer_type: Order::USER, Fulfillment_type: fulfillment_type) }
  let(:line_item) { Fabricate(:line_item, order: order) }
  let(:line_item_totals) { LineItemTotals.new(line_item, fulfillment_type: fulfillment_type, shipping_address: shipping_address, seller_locations: seller_locations, artsy_collects_sales_tax: artsy_collects_sales_tax) }

  describe 'shipping_total_cents' do
    it 'returns nil if missing artwork location' do
    end
    it 'returns nil if missing shipping info' do
    end
    it 'returns shipping total' do
    end
    it 'returns shipping total * quantity' do
    end
  end

  describe 'tax_total_cents' do
  end

  describe 'should_remit_sales_tax' do
  end
end

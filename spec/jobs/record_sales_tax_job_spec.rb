require 'rails_helper'
require 'support/taxjar_helper'

describe RecordSalesTaxJob, type: :job do
  let(:order) { Fabricate(:order, fulfillment_type: Order::PICKUP, shipping_country: 'US', shipping_postal_code: '10013', shipping_region: 'WA', shipping_city: 'New York', shipping_address_line1: '401 Broadway', shipping_total_cents: 100, state: Order::APPROVED) }
  let!(:line_item) { Fabricate(:line_item, order: order, sales_tax_cents: 100_00) }
  let(:artwork_location) do
    {
      country: 'US',
      city: 'Seattle',
      state: 'WA',
      address: '22 Fake St',
      postal_code: 10013
    }
  end
  describe '#perform' do
    before do
      stub_tax_for_order
    end

    it 'posts a transaction to TaxJar and saves the transaction id' do
      expect(GravityService).to receive(:get_artwork).with(line_item.artwork_id).and_return(gravity_v1_artwork(location: artwork_location))
      RecordSalesTaxJob.perform_now(line_item.id)
      expect(line_item.reload.sales_tax_transaction_id).to eq '123'
    end
  end
end

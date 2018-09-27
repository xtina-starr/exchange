require 'rails_helper'

describe RecordSalesTaxJob, type: :job do
  let(:order) { Fabricate(:order, id: 1, fulfillment_type: Order::SHIP, shipping_country: 'US', shipping_postal_code: '10013', shipping_region: 'NY', shipping_city: 'New York', shipping_address_line1: '401 Broadway', shipping_total_cents: 100) }
  let(:shipping_address) do
    Address.new(
      country: order.shipping_country,
      postal_code: order.shipping_postal_code,
      region: order.shipping_region,
      city: order.shipping_city,
      address_line1: order.shipping_address_line1
    )
  end
  let!(:line_item) { Fabricate(:line_item, id: 2, order: order) }
  let(:artwork_address) { Address.new(gravity_v1_artwork[:location]) }
  describe '#perform' do
    it 'instantiates a new SalesTaxService and calls record_tax_collected' do
      sales_tax_instance = double
      expect(SalesTaxService).to receive(:new).with(line_item, order.fulfillment_type, shipping_address, order.shipping_total_cents, artwork_address).and_return(sales_tax_instance)
      expect(sales_tax_instance).to receive(:record_tax_collected).and_return(double(transaction_id: '1-2'))
      expect(GravityService).to receive(:get_artwork).with(line_item.artwork_id).and_return(gravity_v1_artwork)
      RecordSalesTaxJob.perform_now(line_item.id)
      expect(line_item.reload.sales_tax_transaction_id).to eq '1-2'
    end
  end
end

require 'rails_helper'

describe Offers::TotalUpdaterService, type: :services do
  describe '#process!' do
    let(:artsy_collects_sales_tax) { true }
    let(:partner) { { _id: 'partner-1', artsy_collects_sales_tax: artsy_collects_sales_tax } }
    let(:artwork_location) { { country: 'US' } }
    let(:artwork) { { _id: 'a-1', current_version_id: '1', location: artwork_location, domestic_shipping_fee_cents: 1000 } }
    let!(:order) { Fabricate(:order, state: Order::SUBMITTED, seller_id: partner[:_id], **shipping_info) }
    let!(:offer) { Fabricate(:offer, order: order, amount_cents: 10000) }
    let!(:line_item) { Fabricate(:line_item, order: order, artwork_id: artwork[:_id], quantity: 2) }
    let(:partner_address) do
      Address.new(
        street_line1: '401 Broadway',
        country: 'US',
        city: 'New York',
        region: 'NY',
        postal_code: '10013'
      )
    end
    let(:shipping_info) do
      {
        shipping_name: 'Fname Lname',
        shipping_address_line1: '12 Vanak St',
        shipping_address_line2: 'P 80',
        shipping_city: 'New York',
        shipping_postal_code: '02198',
        buyer_phone_number: '00123456',
        shipping_region: 'NY',
        shipping_country: 'US',
        fulfillment_type: Order::SHIP
      }
    end
    let(:tax_calculator) { double('Tax Calculator', sales_tax: 100, artsy_should_remit_taxes?: false) }
    let(:service) { Offers::OfferTotalUpdaterService.new(offer: offer) }

    before do
      expect(Tax::CalculatorService).to receive(:new).with(
        offer.amount_cents,
        offer.amount_cents / order.line_items.first.quantity,
        order.line_items.first.quantity,
        order.fulfillment_type,
        instance_of(Address),
        1000,
        instance_of(Address),
        [partner_address]
      ).and_return(tax_calculator)
      expect(Gravity).to receive_messages(
        fetch_partner: partner,
        fetch_partner_locations: [partner_address],
        get_artwork: artwork
      )
      service.process!
    end

    context 'with an offer' do
      it 'calculates shipping for the offer' do
        expect(offer.shipping_total_cents).to eq 1000
      end

      it 'calculates tax and shipping for the offer' do
        expect(offer.tax_total_cents).to eq 100
        expect(offer.should_remit_sales_tax).to eq false
      end

      context 'seller opts out of tax collection' do
        let(:artsy_collects_sales_tax) { false }

        it 'sets tax_total_cents on offer to 0' do
          expect(offer.tax_total_cents).to eq 0
          expect(offer.should_remit_sales_tax).to eq false
        end
      end
    end
  end
end

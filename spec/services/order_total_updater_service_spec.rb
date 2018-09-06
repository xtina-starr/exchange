require 'rails_helper'

describe OrderTotalUpdaterService, type: :service do
  let(:shipping_total_cents) { nil }
  let(:tax_total_cents) { nil }
  let(:order) { Fabricate(:order, shipping_total_cents: shipping_total_cents, tax_total_cents: tax_total_cents) }
  describe '#update_order_totals!' do
    context 'without line items' do
      it 'returns 0 for everything' do
        OrderTotalUpdaterService.update_totals!(order)
        expect(order.reload.items_total_cents).to eq 0
        expect(order.buyer_total_cents).to eq 0
        expect(order.seller_total_cents).to eq 0
      end
    end
    context 'with line items' do
      let!(:line_items) { [Fabricate(:line_item, order: order, price_cents: 100_00), Fabricate(:line_item, order: order, price_cents: 200_00, quantity: 2)] }
      context 'with shipping and tax' do
        let(:shipping_total_cents) { 50_00 }
        let(:tax_total_cents) { 60_00 }
        context 'without commission rate' do
          it 'sets correct totals on the order' do
            OrderTotalUpdaterService.update_totals!(order)
            expect(order.items_total_cents).to eq 500_00
            expect(order.buyer_total_cents).to eq(500_00 + 50_00 + 60_00)
            expect(order.transaction_fee_cents).to eq 17_99
            expect(order.commission_fee_cents).to be_nil
            expect(order.seller_total_cents).to eq(610_00 - 17_99)
          end
        end
        context 'with commission rate' do
          it 'sets correct totals on the order' do
            OrderTotalUpdaterService.update_totals!(order, 0.40)
            expect(order.items_total_cents).to eq 500_00
            expect(order.buyer_total_cents).to eq(500_00 + 50_00 + 60_00)
            expect(order.transaction_fee_cents).to eq 17_99
            expect(order.commission_fee_cents).to eq 200_00
            expect(order.seller_total_cents).to eq(610_00 - (17_99 + 200_00))
          end
        end
      end
    end
  end
end

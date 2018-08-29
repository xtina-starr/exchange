require 'rails_helper'

describe OrderTotalCalculatorService, type: :service do
  let(:order) { Fabricate(:order, items_total_cents: nil) }
  describe '#items_total_cents' do
    context 'with no line items' do
      it 'returns 0' do
        expect(OrderTotalCalculatorService.items_total_cents(order.line_items)).to eq 0
      end
    end

    context 'with a couple line items' do
      it 'returns the sum of the prices of those line items' do
        Fabricate.times 2, :line_item, order: order, price_cents: 123_00
        expect(OrderTotalCalculatorService.items_total_cents(order.line_items)).to eq 246_00
      end
    end

    context 'with one line item quantity of 2' do
      it 'returns the sum of the prices of those line items' do
        Fabricate(:line_item, order: order, price_cents: 123_00, quantity: 2)
        expect(OrderTotalCalculatorService.items_total_cents(order.line_items)).to eq 246_00
      end
    end

    context 'with a line item that has no price' do
      it 'raises error' do
        Fabricate(:line_item, order: order, price_cents: nil)
        expect { OrderTotalCalculatorService.items_total_cents(order.line_items) }.to raise_error(Errors::OrderError, 'Missing price info on line items')
      end
    end
  end

  describe '#buyer_total_cents' do
    before do
      order.update!(items_total_cents: 200_00)
    end
    context 'without shipping total cents' do
      it 'returns tax + line items' do
        order.update!(tax_total_cents: 100_00)
        expect(OrderTotalCalculatorService.buyer_total_cents(order)).to eq 300_00
      end
    end
    context 'without tax total cents' do
      it 'returns tax + line items' do
        order.update!(shipping_total_cents: 100_00)
        expect(OrderTotalCalculatorService.buyer_total_cents(order)).to eq 300_00
      end
    end
    context 'with shipping/tax and line items' do
      it 'returns shipping + tax + line items' do
        order.update!(shipping_total_cents: 100_00, tax_total_cents: 50_00)
        expect(OrderTotalCalculatorService.buyer_total_cents(order)).to eq 350_00
      end
    end
  end

  describe '#seller_total_cents' do
    before do
      order.update!(items_total_cents: 200_00, buyer_total_cents: 300_00, tax_total_cents: 50_00, shipping_total_cents: 50_00)
    end
    it 'returns correct seller_total_cents' do
      order.update!(commission_fee_cents: 20_00, transaction_fee_cents: 20_00)
      expect(OrderTotalCalculatorService.seller_total_cents(order)).to eq 260_00
    end
    context 'without commission fee' do
      it 'returns correct total cents' do
        order.update!(commission_fee_cents: nil, transaction_fee_cents: 20_00)
        expect(OrderTotalCalculatorService.seller_total_cents(order)).to eq 280_00
      end
    end
    context 'without transaction fee' do
      it 'returns correct total cents' do
        order.update!(commission_fee_cents: 20_00, transaction_fee_cents: nil)
        expect(OrderTotalCalculatorService.seller_total_cents(order)).to eq 280_00
      end
    end
  end
end

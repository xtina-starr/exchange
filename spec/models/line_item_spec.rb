require 'rails_helper'

describe LineItem, type: :model do
  let(:mode) { Order::BUY }
  let(:order) { Fabricate(:order, mode: mode) }

  it_behaves_like 'a papertrail versioned model', :line_item

  describe 'validation' do
    context 'Buy Order' do
      it 'can create many line items' do
        expect do
          order.line_items.create!(quantity: 2)
          order.line_items.create!(quantity: 3)
        end.to change(order.line_items, :count).by(2)
      end
    end

    context 'Offer Order' do
      let(:mode) { Order::OFFER }
      it 'creates line item' do
        expect do
          order.line_items.create!(quantity: 2)
        end.to change(order.line_items, :count).by(1)
      end
      it 'raises error when creating second line item' do
        order.line_items.create!(quantity: 2)
        expect do
          order.line_items.create!(quantity: 4)
        end.to raise_error(ActiveRecord::RecordInvalid, /Order offer order can only have one line item/)
      end
    end
  end
  describe '#total_amount_cents' do
    context 'Offer Order' do
      let(:mode) { Order::OFFER }
      context 'without last offer' do
        it 'returns nil' do
          line_item = Fabricate(:line_item, order: order, list_price_cents: 200, quantity: 3)
          Fabricate(:offer, order: order, amount_cents: 420)
          expect(line_item.total_amount_cents).to be_nil
        end
      end
      context 'with last offer' do
        it 'returns offer amount' do
          line_item = Fabricate(:line_item, order: order, list_price_cents: 200, quantity: 3)
          offer = Fabricate(:offer, order: order, amount_cents: 420)
          order.update!(last_offer: offer)
          expect(line_item.total_amount_cents).to eq 420
        end
      end
    end
    context 'Buy Order' do
      it 'returns total list price' do
        line_item = Fabricate(:line_item, order: order, list_price_cents: 200, quantity: 3)
        expect(line_item.total_amount_cents).to eq 600
      end
    end
  end

  describe '#total_list_price_cents' do
    it 'returns proper list price' do
      line_item = Fabricate(:line_item, list_price_cents: 200, quantity: 3)
      expect(line_item.total_list_price_cents).to eq 600
    end
  end

  describe '#effective_price_cents' do
    let(:line_item) { Fabricate(:line_item, order: order, list_price_cents: 300, quantity: 3) }
    context 'Buy order' do
      it 'returns correct amount' do
        expect(line_item.effective_price_cents).to eq 300
      end
    end
    context 'Offer order' do
      let(:mode) { Order::OFFER }
      before do
        offer = Fabricate(:offer, order: order, amount_cents: 900)
        order.update!(last_offer: offer)
      end
      it 'returns correct amount' do
        expect(line_item.effective_price_cents).to eq 300
      end
    end
  end
end

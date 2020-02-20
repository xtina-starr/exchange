require 'rails_helper'

describe LineItem, type: :model do
  let(:mode) { Order::BUY }
  let(:order) { Fabricate(:order, mode: mode) }

  it_behaves_like 'a papertrail versioned model', :line_item

  describe 'validation' do
    it 'raises error when line item does not have artwork_version_id' do
      expect do
        order.line_items.create!(quantity: 4, artwork_id: "456")
      end.to raise_error(ActiveRecord::RecordInvalid, /Artwork version can't be blank/)
    end

    it 'raises error when line item does not have artwork_id' do
      expect do
        order.line_items.create!(quantity: 4, artwork_version_id: "456")
      end.to raise_error(ActiveRecord::RecordInvalid, /Artwork can't be blank/)
    end
    
    context 'Buy Order' do
      it 'can create many line items' do
        expect do
          order.line_items.create!(quantity: 2, artwork_version_id: "123", artwork_id: "456")
          order.line_items.create!(quantity: 3, artwork_version_id: "123", artwork_id: "456")
        end.to change(order.line_items, :count).by(2)
      end
    end

    context 'Offer Order' do
      let(:mode) { Order::OFFER }
      it 'creates line item' do
        expect do
          order.line_items.create!(quantity: 2, artwork_version_id: "123", artwork_id: "456")
        end.to change(order.line_items, :count).by(1)
      end
      it 'raises error when creating second line item' do
        order.line_items.create!(quantity: 2, artwork_version_id: "123", artwork_id: "456")
        expect do
          order.line_items.create!(quantity: 4, artwork_version_id: "123", artwork_id: "456")
        end.to raise_error(ActiveRecord::RecordInvalid, /Order offer order can only have one line item/)
      end
    end
  end

  describe '#total_list_price_cents' do
    it 'returns proper list price' do
      line_item = Fabricate(:line_item, list_price_cents: 200, quantity: 3, artwork_version_id: "123", artwork_id: "456")
      expect(line_item.total_list_price_cents).to eq 600
    end
  end
end

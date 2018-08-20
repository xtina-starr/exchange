require 'rails_helper'
require 'support/gravity_helper'

describe CreateOrderService, type: :services do
  describe '#with_artwork!' do
    let(:user_id) { 'user-id' }
    context 'with known artwork' do
      before do
        expect(Adapters::GravityV1).to receive(:request).and_return(gravity_v1_artwork)
      end
      context 'without edition set' do
        it 'create order with proper data' do
          expect do
            order = CreateOrderService.with_artwork!(user_id: user_id, artwork_id: 'artwork-id', edition_set_id: nil, quantity: 2)
            expect(order.currency_code).to eq 'USD'
            expect(order.user_id).to eq user_id
            expect(order.partner_id).to eq 'gravity-partner-id'
            expect(order.line_items.count).to eq 1
            expect(order.line_items.first.price_cents).to eq 5400_12
            expect(order.line_items.first.artwork_id).to eq 'artwork-id'
            expect(order.line_items.first.edition_set_id).to be_nil
            expect(order.line_items.first.quantity).to eq 2
          end.to change(Order, :count).by(1).and change(LineItem, :count).by(1)
        end
      end
      context 'with edition set' do
        it 'creates order with proper data' do
          expect do
            order = CreateOrderService.with_artwork!(user_id: user_id, artwork_id: 'artwork-id', edition_set_id: 'edition-set-id', quantity: 2)
            expect(order.currency_code).to eq 'USD'
            expect(order.user_id).to eq user_id
            expect(order.partner_id).to eq 'gravity-partner-id'
            expect(order.line_items.count).to eq 1
            expect(order.line_items.first.price_cents).to eq 4200_42
            expect(order.line_items.first.artwork_id).to eq 'artwork-id'
            expect(order.line_items.first.edition_set_id).to eq 'edition-set-id'
            expect(order.line_items.first.quantity).to eq 2
          end.to change(Order, :count).by(1).and change(LineItem, :count).by(1)
        end
      end
    end
    context 'with unknown artwork' do
      before do
        expect(Adapters::GravityV1).to receive(:request).and_raise(Adapters::GravityError.new('unknown artwork'))
      end
      it 'raises Errors::OrderError' do
        expect { CreateOrderService.with_artwork!(user_id: user_id, artwork_id: 'random-artwork', quantity: 2) }.to raise_error(Errors::OrderError)
      end
    end
  end

  describe '#artwork_price' do
    context 'for artwork' do
      it 'returns artwork price' do
        expect(CreateOrderService.artwork_price(gravity_v1_artwork)).to eq 5400_12
      end
    end
    context 'for edition set' do
      it 'returns edition_set_price for known edition set id' do
        expect(CreateOrderService.artwork_price(gravity_v1_artwork, edition_set_id: 'edition-set-id')).to eq 4200_42
      end
      it 'raises Errors::OrderError for unknown edition set id' do
        expect { CreateOrderService.artwork_price(gravity_v1_artwork, edition_set_id: 'random-id') }.to raise_error(Errors::OrderError, /Unknown edition set/)
      end
    end
  end
end

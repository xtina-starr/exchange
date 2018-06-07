require 'rails_helper'

describe Api::OrdersController, type: :request do
  describe '@create #api/orders' do
    let(:order_params) do
      {
        order: {
          user_id: 'user-id',
          partner_id: 'partner-id'
        }
      }
    end
    it 'raises error when missing order' do
      post '/api/orders', params: { partner_id: 'test' }
      expect(response.status).to eq 422
      expect(response.body).to eq({ errors: [ { order: "is required" }] }.to_json)
    end
    it 'raises error when missing user_id' do
      post '/api/orders', params: { order: { partner_id: 'test-partner' } }
      expect(response.status).to eq 422
      expect(response.body).to eq({ errors: [ { user_id: "is required" }] }.to_json)
    end
    it 'raises error when missing partner_id' do
      post '/api/orders', params: { order: { user_id: 'test-user' } }
      expect(response.status).to eq 422
      expect(response.body).to eq({ errors: [ { partner_id: "is required" }] }.to_json)
    end
    context 'without line line items' do
      it 'creates new order' do
        expect do
          post '/api/orders', params: order_params
          expect(response.status).to eq 200
          result = JSON.parse(response.body, symbolize_names: true)
          expect(result[:order][:id]).not_to be_nil
          expect(result[:order][:user_id]).to eq 'user-id'
          expect(result[:order][:partner_id]).to eq 'partner-id'
          expect(result[:order][:code]).not_to be_nil
        end.to change(Order, :count).by(1)
      end
    end

    context 'with line line items' do
      let(:line_item1) { { artwork_id: 'artwork-1', edition_set_id: 'ed-1', price_cents: 420_00 } }
      let(:line_items) { [line_item1] }
      let(:order_params_with_line_item) {
        {
          order: {
            user_id: 'user-id',
            partner_id: 'partner-id',
            line_items: line_items
          }
        }
      }
      it 'creates new order with line items' do
        expect do
          post '/api/orders', params: order_params_with_line_item
          expect(response.status).to eq 200
          result = JSON.parse(response.body, symbolize_names: true)
          expect(result[:order][:id]).not_to be_nil
          expect(result[:order][:user_id]).to eq 'user-id'
          expect(result[:order][:partner_id]).to eq 'partner-id'
          expect(result[:order][:code]).not_to be_nil
          line_items = result[:order][:line_items]
          expect(line_items.count).to eq 1
          expect(line_items.first[:id]).not_to be_nil
          expect(line_items.first[:price_cents]).to eq 42000
          expect(line_items.first[:artwork_id]).to eq 'artwork-1'
          expect(line_items.first[:edition_set_id]).to eq 'ed-1'
        end.to change(Order, :count).by(1).and change(OrderLineItem, :count).by(1)
      end
    end
  end
end
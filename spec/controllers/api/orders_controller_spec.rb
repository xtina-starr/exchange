require 'rails_helper'

describe Api::OrdersController, type: :request do
  describe '@POST #api/orders' do
    let(:user_id) { 'user-id' }
    let(:partner_id) { 'partner-id' }
    let(:order_params) do
      {
        order: {
          user_id: user_id,
          partner_id: partner_id
        }
      }
    end
    it 'raises error when missing order' do
      post '/api/orders', params: { partner_id: 'test' }
      expect(response.status).to eq 400
      expect(response.body).to eq({ errors: [ { order: "is required" }] }.to_json)
    end
    it 'raises error when missing user_id' do
      post '/api/orders', params: { order: { partner_id: 'test-partner' } }
      expect(response.status).to eq 400
      expect(response.body).to eq({ errors: [ { user_id: "is required" }] }.to_json)
    end
    it 'raises error when missing partner_id' do
      post '/api/orders', params: { order: { user_id: 'test-user' } }
      expect(response.status).to eq 400
      expect(response.body).to eq({ errors: [ { partner_id: "is required" }] }.to_json)
    end
    context 'without line line items' do
      it 'requires line item' do
        post '/api/orders', params: order_params
        expect(response.status).to eq 400
        expect(response.body).to eq({ errors: [ { line_items: "is required" }] }.to_json)
      end
    end

    context 'with line line items' do
      let(:artwork_id) { 'artwork-1' }
      let(:edition_set_id) { 'ed-1'}
      let(:line_item1) { { artwork_id: artwork_id, edition_set_id: edition_set_id, price_cents: 420_00 } }
      let(:line_items) { [line_item1] }
      let(:order_params_with_line_item) {
        {
          order: {
            user_id: user_id,
            partner_id: partner_id,
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
          expect(result[:order][:user_id]).to eq user_id
          expect(result[:order][:partner_id]).to eq partner_id
          expect(result[:order][:code]).not_to be_nil
          line_items = result[:order][:line_items]
          expect(line_items.count).to eq 1
          expect(line_items.first[:id]).not_to be_nil
          expect(line_items.first[:price_cents]).to eq 42000
          expect(line_items.first[:artwork_id]).to eq artwork_id
          expect(line_items.first[:edition_set_id]).to eq 'ed-1'
        end.to change(Order, :count).by(1).and change(LineItem, :count).by(1)
      end
      context 'with existing orders with requested artwork_id' do
        let!(:order) { Fabricate(:order, user_id: user_id, partner_id: partner_id) }
        let!(:line_item) { Fabricate(:line_item, order: order, artwork_id: artwork_id, edition_set_id: 'ed-1') }
        context 'pending order' do
          it 'raises error when creating order with same artwork id' do
            post '/api/orders', params: order_params_with_line_item
            expect(response.status).to eq 400
            expect(response.body).to eq "{\"errors\":[{\"failed_request\":\"Existing pending order.\"}]}"
          end
        end
        context 'on different edition_set' do
          let(:edition_set_id) { 'ed-2' }
          it 'raises error when creating order with same artwork id' do
            expect do
              post '/api/orders', params: order_params_with_line_item
              expect(response.status).to eq 200
            end.to change(Order, :count).by(1).and change(LineItem, :count).by(1)
          end
        end
      end
    end
  end
end

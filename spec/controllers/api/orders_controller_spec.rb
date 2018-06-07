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

    context 'unauthorized' do
      it 'raises error when there is no header' do
        post '/api/orders', params: order_params
        expect(response.status).to eq 401
      end
      it 'raises error when unknown jwt' do
        post '/api/orders', params: order_params, headers: { 'Authorization' => "Bearer: random-token" }
        expect(response.status).to eq 401
      end
    end

    context 'authorized' do
      let(:headers) { jwt_headers(user_id: user_id, partner_ids: [partner_id]) }
      let(:another_user_headers) { jwt_headers(user_id: 'random-user', partner_ids: [partner_id]) }
      it 'raises error when missing order' do
        post '/api/orders', params: { partner_id: 'test', user_id: 'test-user' }, headers: headers
        expect(response.status).to eq 401
        expect(response.body).to eq({ errors: [ { failed_request: "Not Permitted." }] }.to_json)
      end
      it 'raises auth error when missing user_id' do
        post '/api/orders', params: { order: { partner_id: 'test-partner' } }, headers: headers
        expect(response.status).to eq 401
        expect(response.body).to eq({ errors: [ { failed_request: "Not Permitted." }] }.to_json)
      end
      it 'raises error when missing partner_id' do
        post '/api/orders', params: { order: { user_id: user_id } }, headers: headers
        expect(response.status).to eq 400
        expect(response.body).to eq({ errors: [ { partner_id: "is required" }] }.to_json)
      end
      context 'without line line items' do
        it 'requires line item' do
          post '/api/orders', params: order_params, headers: headers
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
        it 'raises error when using other users token' do
          post '/api/orders', params: order_params_with_line_item, headers: another_user_headers
          expect(response.status).to eq 401
        end
        it 'creates new order with line items' do
          expect do
            post '/api/orders', params: order_params_with_line_item, headers: headers
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
              post '/api/orders', params: order_params_with_line_item, headers: headers
              expect(response.status).to eq 400
              expect(response.body).to eq "{\"errors\":[{\"failed_request\":\"Existing pending order.\"}]}"
            end
          end
          context 'on different edition_set' do
            let(:edition_set_id) { 'ed-2' }
            it 'raises error when creating order with same artwork id' do
              expect do
                post '/api/orders', params: order_params_with_line_item, headers: headers
                expect(response.status).to eq 200
              end.to change(Order, :count).by(1).and change(LineItem, :count).by(1)
            end
          end
        end
      end
    end
  end
end

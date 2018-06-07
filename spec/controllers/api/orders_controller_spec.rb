require 'rails_helper'

describe Api::OrdersController, type: :request do
  describe '@create #api/orders' do
    let(:valid_params) do
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
    it 'creates new order' do
      expect do
        post '/api/orders', params: valid_params
        expect(response.status).to eq 200
        result = JSON.parse(response.body, symbolize_names: true)
        expect(result[:order][:id]).not_to be_nil
        expect(result[:order][:user_id]).to eq 'user-id'
        expect(result[:order][:partner_id]).to eq 'partner-id'
        expect(result[:order][:code]).not_to be_nil
      end.to change(Order, :count).by(1)
    end
  end
end
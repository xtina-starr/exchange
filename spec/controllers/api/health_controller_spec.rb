require 'rails_helper'

describe Api::HealthController, type: :request do
  describe '@GET #api/health' do
    context 'unauthorized' do
      it 'returns healthy: true' do
        get '/api/health'
        expect(response.status).to eq 200
        expect(response.body).to eq({ healthy: true }.to_json)
      end
    end
  end
end

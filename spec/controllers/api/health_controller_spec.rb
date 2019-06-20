# typed: false
require 'rails_helper'

describe Api::HealthController, type: :request do
  describe '@GET #api/health' do
    context 'unauthorized' do
      it 'returns healthy: true' do
        get '/api/health'
        expect(response.status).to eq 200
        result = JSON.parse(response.body)
        expect(result['api_healthy']).to eq(true)
        expect(result['worker_health']).to eq('OK')
        expect(result['worker_default_queue_size']).not_to be_nil
      end
    end
  end
end

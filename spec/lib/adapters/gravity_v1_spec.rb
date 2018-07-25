require 'rails_helper'
require 'webmock/rspec'

describe Adapters::GravityV1 do
  it 'raises Gravity Error when get 404' do
    stub_request(:get, /artwork/).to_return(status: 404, body: { error: 'cannot find' }.to_json)
    expect do
      Adapters::GravityV1.request('artwork/2')
    end.to raise_error(Adapters::GravityError)
  end
end

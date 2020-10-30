require 'rails_helper'

describe 'time zone parsing' do
  it 'handles daylight saving time properly' do
    utc = '2020-12-01T00:00:00+00:00'
    est = '2020-11-30T19:00:00-05:00'
    expect(Time.parse(utc).in_time_zone('America/New_York').iso8601).to eq est
  end
end

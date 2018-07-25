module Adapters
  class GravityError < StandardError
  end
  class GravityV1
    def self.request(url)
      url = "#{Rails.application.config_for(:gravity)['api_v1_root']}#{url}"
      response = Faraday.get(url, {}, headers)
      raise GravityError, "couldn't perform request! Response was #{response.status}." unless response.success?
      JSON.parse(response.body, symbolize_names: true)
    rescue StandardError => e
      raise GravityError, e.message
    end

    def self.headers
      {
        'X-XAPP-TOKEN' => Rails.application.config_for(:gravity)['xapp_token']
      }
    end
  end
end

module Adapters
  class GravityError < StandardError; end
  class GravityNotFoundError < GravityError; end
  class GravityV1
    def self.request(url)
      url = "#{Rails.application.config_for(:gravity)['api_v1_root']}#{url}"
      response = Faraday.get(url, {}, headers)
      raise GravityNotFoundError if response.status == 404
      raise GravityError, "couldn't perform request! Response was #{response.status}." unless response.success?
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.headers
      {
        'X-XAPP-TOKEN' => Rails.application.config_for(:gravity)['xapp_token']
      }
    end
  end
end

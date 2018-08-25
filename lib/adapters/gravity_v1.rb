module Adapters
  class GravityError < StandardError; end
  class GravityNotFoundError < GravityError; end
  class GravityV1
    def self.get(url, params: {})
      url = "#{Rails.application.config_for(:gravity)['api_v1_root']}#{url}"
      response = Faraday.get(url, params, headers)
      process(response)
    end

    def self.put(url, params: {})
      url = "#{Rails.application.config_for(:gravity)['api_v1_root']}#{url}"
      response = Faraday.put(url, params, headers)
      process(response)
    end

    def self.process(response)
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

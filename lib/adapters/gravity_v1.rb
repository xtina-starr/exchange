module Adapters
  class GravityError < StandardError
    attr_reader :message, :status
    def initialize(message, status = nil)
      @message = message
      @status = status
    end
  end
  class GravityV1
    def self.request(url)
      url = "#{Rails.application.config_for(:gravity)['api_v1_root']}#{url}"
      response = Faraday.get(url, {}, headers)
      raise GravityError.new("couldn't perform request! Response was #{response.status}.", response.status) unless response.success?
      JSON.parse(response.body, symbolize_names: true)
    rescue GravityError => e
      raise e
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

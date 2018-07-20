require 'net/http'

module Adapters
  class GravityError < StandardError
  end
  class GravityV1
    def self.request(url)
      base_url = "#{Rails.application.config_for(:gravity)['api_v1_root']}#{url}"
      uri = URI.parse(base_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Get.new("#{uri.path}?#{uri.query}", headers)
      response = http.request(req)
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

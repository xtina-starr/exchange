module Api
  class HealthController < Api::BaseApiController
    skip_before_action :authenticate_request!

    def index
      render json: { healthy: true }
    end
  end
end

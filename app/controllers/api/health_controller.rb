module Api
  class HealthController < Api::BaseApiController
    skip_before_action :authenticate_request!
    SIDEKIQ_ALERT_THRESHOLD = 100

    def index
      render json: {
        healthy: true,
        worker_health: Sidekiq::Queue.new.size < SIDEKIQ_ALERT_THRESHOLD ? 'OK' : 'OY'
      }
    end
  end
end

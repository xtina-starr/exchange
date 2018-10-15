module Api
  class WebhookController < Api::BaseApiController
    skip_before_action :authenticate_request!

    def stripe
      
    end
  end
end

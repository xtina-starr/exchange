module Api
  class WebhookController < Api::BaseApiController
    skip_before_action :authenticate_request!

    def stripe
      signature_header = request.headers['Stripe-Signature']
      error!('Missing required header.', 400) unless sig_header
      begin
        event = Stripe::Webhook.construct_event(request.body.read, signature_header, Rails.application.config_for(:stripe)['webhook_secret'])
        StripeWebhookService.new(event).process!
      rescue JSON::ParserError => e
        error!('Invalid payload.', 400)
      rescue Stripe::SignatureVerificationError => e
        Rails.logger.info("Received request with invalid stripe signature: #{sig_header}")
        error!('Invalid request header.', 400)
      end
    end

    private

    def stripe_params
      params.require(:id)
    end
  end
end

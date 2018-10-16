module Api
  class WebhooksController < Api::BaseApiController
    skip_before_action :authenticate_request!

    def stripe
      signature_header = request.headers['Stripe-Signature']
      error!('Missing required header.', 400) unless signature_header
      begin
        event = Stripe::Webhook.construct_event(request.body.read, signature_header, Rails.application.config_for(:stripe)['webhook_secret'])
        StripeWebhookService.new(event).process!
      rescue JSON::ParserError
        render json: { error: 'Invalid payload' }, status: :bad_request
      rescue Stripe::SignatureVerificationError
        Rails.logger.info("Received request with invalid stripe signature: #{signature_header}")
        render json: { error: 'Invalid request header' }, status: :bad_request
      end
    end
  end
end

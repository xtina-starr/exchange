module Api
  class WebhooksController < Api::BaseApiController
    skip_before_action :authenticate_request!

    before_action :require_stripe_header, only: :stripe

    def stripe
      event = Stripe::Webhook.construct_event(request.body.read, @signature_header, Rails.application.config_for(:stripe)['webhook_secret'])
      StripeWebhookService.new(event).process!
    rescue JSON::ParserError
      Rails.logger.warn("Invalid Stripe webhook payload #{event}")
      render json: { error: 'Invalid payload' }
    rescue Stripe::SignatureVerificationError
      Rails.logger.warn("Received request with invalid stripe signature: #{@signature_header}")
      render json: { error: 'Invalid request header' }
    end

    def require_stripe_header
      @signature_header = request.headers['Stripe-Signature']
      render json: { error: 'Missing required header.' } unless @signature_header
    end
  end
end

# typed: strict
require 'stripe'
Stripe.api_key = Rails.application.config_for(:stripe)['stripe_api_key']

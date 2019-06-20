# typed: strict
Artsy::EventService.configure do |config|
  config.app_name = 'Exchange' # Used for RabbitMQ queue name
  config.event_stream_enabled = true
  config.rabbitmq_url = ENV['RABBITMQ_URL']
  config.verify_peer = true
end

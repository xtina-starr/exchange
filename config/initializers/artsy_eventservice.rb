Artsy::EventService.configure do |config|
  config.app_name = 'Exchange'  # Used for RabbitMQ queue name
  config.event_stream_enabled = true
  config.rabbitmq_url = ENV['RABBITMQ_URL']
  config.verify_peer = true  # Boolean used to decide in case we are using tls, we should verify peer or not
end

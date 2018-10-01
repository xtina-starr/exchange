# frozen_string_literal: true

Datadog.configure do |c|
  enabled = ENV.fetch('DATADOG_ENABLED', false)
  hostname = ENV.fetch('TRACE_AGENT_HOSTNAME', 'localhost')

  c.tracer enabled: enabled, hostname: hostname, distributed_tracing: true, debug: false
  c.use :rails, service_name: 'exchange', controller_service: 'exchange.controller', cache_service: 'exchange.cache', database_service: 'exchange.postgres'
  c.use :redis, service_name: 'exchange.redis'
  c.use :sidekiq, service_name: 'exchange.sidekiq'
  c.use :http, service_name: 'exchange.http', distributed_tracing: true
end

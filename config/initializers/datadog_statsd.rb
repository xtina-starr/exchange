module Datadog
  module StatsdDisabled
    attr_accessor :disabled

    def send_to_socket(message)
      print message
      super unless disabled
    end
  end
end

Datadog::Statsd.prepend Datadog::StatsdDisabled

module Exchange
  def self.dogstatsd
    @dogstatsd ||= Datadog::Statsd.new(ENV.fetch('DATADOG_TRACE_AGENT_HOSTNAME', 'localhost'), 8125,
      tags: ["service:exchange"]
    ).tap { |d| d.disabled = !(ENV['DATADOG_ENABLED'] == 'true') }
  end
end

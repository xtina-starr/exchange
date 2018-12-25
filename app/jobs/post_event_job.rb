class PostEventJob < ApplicationJob
  queue_as :default

  def perform(event_json, routing_key)
    Artsy::EventService.post_data(topic: TOPIC, data: event_json, routing_key: routing_key)
  end
end

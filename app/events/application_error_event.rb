class ApplicationErrorEvent < Events::BaseEvent
  TOPIC = 'commerce'.freeze

  def initialize(application_error)
    @application_error = application_error
  end

  def to_json
    {
      type: @application_error.type,
      code: @application_error.code,
      created_at: Time.now.utc,
      data: @application_error.data
    }.to_json
  end

  def routing_key
    "error.#{@application_error.type}.#{@application_error.code}"
  end
end

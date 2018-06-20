class Types::DateTimeType < Types::BaseScalar
  description 'A valid URL, transported as a string'

  def self.coerce_input(input_value, _context)
    # Parse the incoming object into a DateTime
    input_value.to_datetime
  end

  def self.coerce_result(ruby_value, _context)
    # It's transported as a string, so stringify it
    ruby_value.to_s
  end
end

class Types::ApplicationErrorType < Types::BaseObject
  description 'An generic error type for mutations'
  graphql_name 'ApplicationError'

  field :code, String, null: false, description: 'Code of this error'
  field :data, String, null: true, description: 'What caused the error'
  field :type, String, null: false, description: 'Type of this error'

  def self.from_application(err)
    format_error_type(type: err.type, code: err.code, data: err.data)
  end

  def self.from_generic_exception(err)
    format_error_type(type: :internal, code: :generic, data: { message: err.message })
  end

  def self.format_error_type(type:, code:, data: nil)
    {
      code: code,
      data: data,
      type: type
    }
  end
end
class Types::ApplicationErrorType < Types::BaseObject
  description 'An generic error type for mutations'
  graphql_name 'ApplicationError'

  field :code, String, null: false, description: 'Code of this error'
  field :description, String, null: true, description: 'What caused the error'
  field :type, String, null: false, description: 'Type of this error'

  def self.from_application(err)
    {
      code: err.code,
      description: err.to_s,
      type: err.type.to_s
    }
  end
end

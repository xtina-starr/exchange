class Types::MutationErrorType < Types::BaseObject
  description 'An generic error type for mutations'
  graphql_name 'MutationError'

  field :description, String, null: false, description: 'What error has occured'
  field :failure_reason, String, null: true, description: 'What caused the error'
  field :recovery_suggestion, String, null: true, description: 'What can the user do to fix the error'
  field :code, Integer, null: true, description: 'Optional error code, for example when coming from a REST request'

  def self.from_application(err)
    {
      description: err.message
    }
  end
end

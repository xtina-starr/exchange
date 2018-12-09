class Mutations::BaseMutation < GraphQL::Schema::RelayClassicMutation
  include RequestValidator

  private

  def current_user_id
    context[:current_user]['id']
  end
end

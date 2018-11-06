namespace 'graphql' do
  namespace 'schema' do
    desc 'fail if there is uncommitted diff in _schema.graphql'
    task :diff_check do
      is_successful = system(
        'rake graphql:schema:idl > /dev/null && ' \
        'git diff --exit-code _schema.graphql > /dev/null'
      )

      raise(failure_message) unless is_successful
    end

    def failure_message
      "\nYou changed your GraphQL types without updating the schema. \n" \
        "Run a `rake graphql:schema:idl` and commit to perform the schema update.\n\n"
    end
  end
end

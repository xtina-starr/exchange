namespace 'graphql' do
  namespace 'schema' do
    desc 'fail if there is ungenerated diff in _schema.graphql'
    task :diff_check do
      puts 'Checking for GraphQL schema diffs...'
      no_schema_diff_exists = system(
        'cp _schema.graphql{,.orig} &&' \
        'rake graphql:schema:idl > /dev/null && ' \
        'diff _schema.graphql.orig _schema.graphql'
      )

      if no_schema_diff_exists
        system('rm _schema.graphql.orig')
      else
        raise failure_message
      end
    end

    def failure_message
      "\nYou changed your GraphQL types without updating the schema. \n" \
        "Run a `rake graphql:schema:idl` and commit to perform the schema update.\n\n"
    end
  end
end

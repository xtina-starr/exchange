namespace 'graphql' do
  namespace 'schema' do
    schema_file_path = '_schema.graphql'.freeze
    orig_schema_path = '_schema.graphql.orig'.freeze

    desc 'fail if there is ungenerated diff in _schema.graphql'
    task diff_check: :environment do
      puts 'Checking for GraphQL schema diffs...'

      cp schema_file_path, orig_schema_path, verbose: false
      Rake::Task['graphql:schema:idl'].invoke

      raise failure_message unless identical?(schema_file_path, orig_schema_path)
    ensure
      rm(orig_schema_path, verbose: false) if File.exist?(orig_schema_path)
    end

    def failure_message
      "\nYou changed your GraphQL types without updating the schema. \n" \
        "Run a `rake graphql:schema:idl` and commit to perform the schema update.\n\n"
    end
  end
end

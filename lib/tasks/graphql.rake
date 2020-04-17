namespace 'graphql' do
  namespace 'schema' do
    SCHEMA_FILE_PATH = '_schema.graphql'.freeze
    ORIG_SCHEMA_PATH = '_schema.graphql.orig'.freeze

    desc 'fail if there is ungenerated diff in _schema.graphql'
    task diff_check: :environment do
      puts 'Checking for GraphQL schema diffs...'

      cp SCHEMA_FILE_PATH, ORIG_SCHEMA_PATH, verbose: false
      Rake::Task['graphql:schema:idl'].invoke

      raise failure_message unless identical?(SCHEMA_FILE_PATH, ORIG_SCHEMA_PATH)
    ensure
      rm(ORIG_SCHEMA_PATH, verbose: false) if File.exist?(ORIG_SCHEMA_PATH)
    end

    def failure_message
      "\nYou changed your GraphQL types without updating the schema. \n" \
        "Run a `rake graphql:schema:idl` and commit to perform the schema update.\n\n"
    end
  end
end

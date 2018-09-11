# This Dangerfile runs on CI, instead of the dangerfile.ts which runs on Peril.
#
# Running on CI gives this version of danger the chance to compare the local schema
# correctly because it can run the ruby code in a ruby environment.

# Import the rails app
require_relative 'config/environment'
current_schema = GraphQL::Schema::Printer.print_schema(ExchangeSchema)
original_schema = File.read(Rails.root.join('_schema.graphql'))

# Ensure that the schemas are always up-to-date
if current_schema != original_schema
  failure 'Please update the local graphql schema, you can do this by running `rake graphql:schema:idl` in exchange.'

  # Provide a nice diff
  require 'diffy'
  diff = Diffy::Diff.new(original_schema, current_schema)
  markdown "```diff\n#{diff}\n```"
end

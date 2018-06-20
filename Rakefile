require_relative 'config/application'
require 'graphql/rake_task'

Rails.application.load_tasks

GraphQL::RakeTask.new(schema_name: 'ExchangeSchema')

if %w[development test].include? Rails.env
  require 'rubocop/rake_task'
  desc 'Run RuboCop'
  RuboCop::RakeTask.new(:rubocop)

  Rake::Task[:default].clear
  task default: %i[rubocop spec]
end

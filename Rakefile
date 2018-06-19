require_relative 'config/application'
require 'graphql/rake_task'

Rails.application.load_tasks

GraphQL::RakeTask.new(schema_name: 'StressSchema')

if %w[development test].include? Rails.env
  Rake::Task[:default].clear
  task default: %i[spec]
end

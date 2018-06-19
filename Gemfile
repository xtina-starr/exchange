source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '5.2.0'
gem 'pg'
gem 'puma'

gem 'graphql'
gem 'jwt'
gem 'sidekiq'

group :development, :test do
  gem 'rails-pry'
  gem 'rspec-rails'
  gem 'graphlient'
end

group :development do
  gem 'listen'
end

group :test do
  gem 'fabrication'
end

source 'https://rubygems.org'

ruby File.read('.ruby-version')

gem 'rails', '5.2.0'

gem 'pg'
gem 'puma'

gem 'activeadmin'
gem 'artsy-auth'
gem 'artsy-eventservice'
gem 'dalli'
gem 'faraday'
gem 'graphql'
gem 'jwt'
gem 'micromachine'
gem 'paper_trail'
gem 'sidekiq'
gem 'stripe'

group :development, :test do
  gem 'byebug'
  gem 'graphlient'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :development do
  gem 'listen'
end

group :test do
  gem 'fabrication'
  gem 'stripe-ruby-mock', '~> 2.5.4', require: 'stripe_mock'
  gem 'webmock'
end

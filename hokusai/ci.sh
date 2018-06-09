#!/bin/sh

set +x

rails db:create RACK_ENV=test
rails db:setup RACK_ENV=test
rails db:migrate RACK_ENV=test
bundle exec rspec --order rand
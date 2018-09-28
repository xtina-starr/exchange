#!/bin/sh

set +x

rails db:create RACK_ENV=test
rails db:setup RACK_ENV=test
rails db:migrate RACK_ENV=test
echo $COVERALLS_REPO_TOKEN
COVERALLS_REPO_TOKEN=$COVERALLS_REPO_TOKEN bundle exec rake

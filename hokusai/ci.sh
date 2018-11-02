#!/bin/sh

set +x

#curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
#apt-get update
#apt-get install -y google-chrome-stable

#chromedriver-update 2.37
rails db:create RACK_ENV=test
rails db:setup RACK_ENV=test
rails db:migrate RACK_ENV=test
bundle exec rake

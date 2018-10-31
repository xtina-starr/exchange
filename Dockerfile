FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y \
  libpq-dev nodejs && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Set up deploy user
RUN adduser --disabled-password --gecos '' deploy

# Install chrome
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update
RUN apt-get install -y google-chrome-stable

# Set up gems
WORKDIR /tmp
ADD .ruby-version .ruby-version
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install -j4

# Finally, add the rest of our app's code
# (this is done at the end so that changes to our app's code
# don't bust Docker's cache)
ADD . /app
WORKDIR /app
RUN chown -R deploy:deploy /app

# Switch to deploy user
USER deploy
ENV USER deploy
ENV HOME /home/deploy

ENV PORT 8080
EXPOSE 8080

CMD bundle exec rails server

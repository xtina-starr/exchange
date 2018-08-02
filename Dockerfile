FROM bitnami/ruby:2.5.1

RUN install_packages libpq-dev nodejs
# Install packages
RUN gem install bundler

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Set up deploy user
RUN adduser --disabled-password --gecos '' deploy

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

####################################################
# capistrano deploy container
####################################################
FROM ruby

RUN gem install capistrano --version"=3.5.0"
RUN gem install capistrano-rvm --version"=0.1.2"
RUN gem install capistrano-rails --version"=1.1.6"
RUN gem install capistrano-bundler --version"=1.1.4"
RUN gem install capistrano3-puma --version"=1.2.1"
RUN gem install capistrano-newrelic --version"=0.0.9"

WORKDIR /app

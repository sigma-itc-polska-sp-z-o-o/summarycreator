FROM ruby:2.6

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -qq && apt-get install -y build-essential ruby-dev zlib1g-dev liblzma-dev
RUN apt-get install -y imagemagick libav-tools

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash
RUN apt-get install -y nodejs
RUN mkdir -p /home/app/
WORKDIR /home/app/

RUN /bin/bash -l -c "gem install bundler"
COPY Gemfile Gemfile.lock ./
RUN /bin/bash -l -c "bundle install --full-index --jobs 20 --retry 5"


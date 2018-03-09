FROM ruby:2.5.0-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential \
    libsqlite3-dev \
    nodejs \
    sqlite3 \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /rails_app
WORKDIR /rails_app

RUN echo "ruby '2.5.0'\n source 'https://rubygems.org'\n gem 'rails', '~> 5.1.0'\n" > Gemfile
RUN bundle install

RUN rails new temp_app
RUN rm -rf temp_app

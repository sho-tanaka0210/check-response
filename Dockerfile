FROM ruby:2.7.0-alpine3.11

LABEL maintainer Mizukichi0210<canaryyellow.nl@gmail.com>

WORKDIR /confirm_rest_api

COPY Gemfile .
COPY Gemfile.lock .

RUN apk update && \
  apk upgrade && \
  apk add --update --no-cache --virtual=.build-dependencies \
      build-base \
      postgresql-dev \
      ruby-dev \
      zlib-dev && \
    apk add --update --no-cache \
      postgresql \
      tzdata  \
      yarn && \
    bundle config set no-cache 'true' && \
    bundle install -j4  && \
    apk del .build-dependencies

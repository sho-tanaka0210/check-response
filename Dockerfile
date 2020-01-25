# FROM ruby:2.7.0
FROM ruby:2.7.0-alpine3.11

LABEL maintainer Mizukichi0210<canaryyellow.nl@gmail.com>

# WORKDIR /confirm_rest_api

# ENV BUNDLE_PATH=/usr/local/bundle

# # COPY Gemfile .

# RUN apk update && \
#   apk upgrade && \
#   apk add --update --no-cache --virtual=.build-dependencies \
#       build-base \
#       curl-dev \
#       linux-headers \
#       libxml2-dev \
#       libxslt-dev \
#       postgresql-dev \
#       ruby-dev \
#       yaml-dev \
#       zlib-dev && \
#     apk add --update --no-cache \
#       postgresql \
#       tzdata  \
#       yarn && \
#     apk del .build-dependencies

# RUN bundle update && bundle install

WORKDIR /tmp
COPY Gemfile .
RUN apk update && \
  apk upgrade && \
  apk add --update --no-cache --virtual=.build-dependencies \
      build-base \
      curl-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      postgresql-dev \
      ruby-dev \
      yaml-dev \
      zlib-dev && \
    apk add --update --no-cache \
      postgresql \
      tzdata  \
      yarn && \
    bundle install -j4 && \
    apk del .build-dependencies
  
RUN bundle update && bundle install

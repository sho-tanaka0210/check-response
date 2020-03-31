#!/bin/ash
rm -f tmp/pids/server.pid
rake db:create
rake db:migrate
bundle exec bundle exec rails s -p $1 -b '0.0.0.0'

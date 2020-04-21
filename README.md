# README

.env file should not be pushed into github repository (doing so only for convinience of the task)

In production we should use something like rails credentials (or if deploy will be on heroku - we should use their method of secrets storing)

docker-compose build

docker-compose run web rake db:create db:setup 

docker-compose up

Ruby 2.6.3

Rails 6.0

# README

- Ruby version
  - 2.3.0

- Rails version
  - 5

- Database creation
 - rake db:create
 - rake db:migrate
 - rake db:setup

- Database initialization
 - MySQL

- How to run the test suite
  - bundle exec rspec spec

- Create authorization token
  - bundle exec rails c
  - ApiKey.create!

- Restaurant Index Curl request
  - curl -X GET -H "Authorization: example_access_token" -H "Cache-Control: no-cache" -H 'http://localhost:3000/api/v1/restaurants'

- Restaurant Show Curl request
  - curl -X GET -H "Authorization: example_access_token" -H "Cache-Control: no-cache" -H 'http://localhost:3000/api/v1/restaurants/1?restaurant_id=1'

- Restaurant Index Curl request with pagination
  - curl -X GET -H "Authorization: example_access_token" -H "Cache-Control: no-cache" -H 'http://localhost:3000/api/v1/restaurants?[page][number]=0&[page][size]=3'

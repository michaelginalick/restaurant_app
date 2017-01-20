# README

1. Ruby version
⋅⋅* 2.3.0

2. Rails version
⋅⋅* 5

3. Database creation
..* rake db:create
..* rake db:migrate
..* rake db:setup

4. Database initialization
..* MySQL

5. How to run the test suite
..* bundle exec rspec spec

6. Create authorization token
..* bundle exec rails c
..* ApiKey.create!

7. Restaurant Index Curl request
..* curl -X GET -H "Authorization: example_access_token" -H "Cache-Control: no-cache" -H 'http://localhost:3000/api/v1/restaurants'

8. Restaurant Show Curl request
..* curl -X GET -H "Authorization: example_access_token" -H "Cache-Control: no-cache" -H 'http://localhost:3000/api/v1/restaurants/1?restaurant_id=1'

9. Restaurant Index Curl request with pagination
..* curl -X GET -H "Authorization: s6skt11c0gO5Ar1PvCMZb2yus3wHYB_0" -H "Cache-Control: no-cache" -H 'http://localhost:3000/api/v1/restaurants?[page][number]=0&[page][size]=3'

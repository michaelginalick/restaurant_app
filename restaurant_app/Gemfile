source "https://rubygems.org"

ruby "2.3.0"

## App
gem "rails", ">= 5.0.0.beta3", "< 5.1"
gem "mysql2"
gem "kaminari"
gem 'rake', '< 11.0'

## Documentation
gem "apipie-rails"

## Assets
gem "autoprefixer-rails"
gem "sass"
gem "sassc-rails"
gem "uglifier", ">= 1.3.0"
gem "rack-cors", require: "rack/cors"
gem "activerecord-import"

group :development do
  gem "quiet_assets"
  gem "i18n-debug"
end

group :test, :development do
  gem "awesome_print"
  gem 'listen'
  gem "rspec-rails", "3.5.0.beta1"
  gem "rails-controller-testing", git: "https://github.com/rails/rails-controller-testing"
  gem "rspec_junit_formatter", "0.2.2"
  gem "factory_girl_rails"
  gem "shoulda-matchers"
  gem "byebug"
  gem "pry"
  gem "pry-rails"
  gem "faker"
  gem "webmock"
end

group :test do
  gem "json-schema"
  gem "database_cleaner"
  gem "simplecov", require: false
end

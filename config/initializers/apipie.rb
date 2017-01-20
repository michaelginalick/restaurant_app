Apipie.configure do |config|
  config.app_name                = "restaurant_app"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apidoc"
  config.validate = false
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
end
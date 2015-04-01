Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.active_support.deprecation = :stderr
  config.assets.raise_runtime_errors = true
  config.assets.js_compressor = :uglifier

  # APP NAME
  APP_NAME = 'App Name'

  # PAGE TITLE
  TITLE = "#{APP_NAME} [Staging]"

  # AUTH
  AUTH = {'admin' => 'password'}

  # ENV
  E = Rails.env

end
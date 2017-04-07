require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Facemash
  class Application < Rails::Application
    config.autoload_paths += %W["#{config.root}/app/validators"]

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
      end
    end
  end
end

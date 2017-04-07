class API::V1::Base < Grape::API
  version 'v1'
  format :json
  prefix :api

  include API::V1::Helpers::Errors
  helpers API::V1::Helpers::Defaults

  mount API::V1::Registrations

  add_swagger_documentation(
    api_version: 'v1',
    hide_documentation_path: true,
    hide_format: true,
    info: {
      title: 'API documentation'
    }
  )
end

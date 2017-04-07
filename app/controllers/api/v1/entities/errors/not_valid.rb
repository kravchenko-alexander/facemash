class API::V1::Entities::Errors::NotValid < Grape::Entity
  expose :type, documentation: { type: 'string', values: ['NotValid'] }
  expose :message, documentation: { type: 'string', values: ['Model has invalid format, model is too short'] }
end

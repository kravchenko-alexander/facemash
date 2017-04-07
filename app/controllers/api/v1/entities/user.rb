class API::V1::Entities::User < Grape::Entity
  expose :id, documentation: { type: 'integer', values: [1] }
  expose :email, documentation: { type: 'string', values: ['moderator@mail.com'] }
  expose :first_name, documentation: { type: 'string', values: ['Alex'] }
  expose :last_name, documentation: { type: 'string', values: ['Johnson'] }
  expose :created_at, documentation: { type: 'datetime', values: [Time.zone.now] }
  expose :updated_at, documentation: { type: 'datetime', values: [Time.zone.now] }
end

class API::V1::Registrations < Grape::API
  resource :registrations do
    desc 'Sign Up Moderator' do
      success API::V1::Entities::User
      failure [[422, 'NotValid', API::V1::Entities::Errors::NotValid]]
    end
    params do
      requires :user, type: Hash do
        requires :email, type: String, allow_blank: false, regexp: EmailValidator::EMAIL_REGEXP, desc: 'Email'
        requires :password, type: String, allow_blank: false, desc: 'Password'
        requires :password_confirmation, type: String, allow_blank: false, desc: 'Password confirmation'
        optional :first_name, type: String, allow_blank: true, desc: 'First name'
        optional :last_name, type: String, allow_blank: true, desc: 'Last name'
      end
    end
    post do
      user = Users::Moderator.new(declared(params).user)
      if user.save
        present user, with: API::V1::Entities::User
      else
        render_not_valid!(user.errors)
      end
    end
  end
end

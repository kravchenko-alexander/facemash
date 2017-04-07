module API::V1::Helpers::Errors
  extend ActiveSupport::Concern

  included do
    rescue_from Grape::Exceptions::ValidationErrors do |e|
      render_not_valid!(e.full_messages)
    end

    helpers do
      def render_error!(type, message, status)
        error!({ type: type, message: message }, status)
      end

      def render_not_valid!(message)
        render_error!('NotValid', message, 422)
      end
    end
  end
end

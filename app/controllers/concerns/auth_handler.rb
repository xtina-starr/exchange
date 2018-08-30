module AuthHandler
  def self.included(clazz)
    clazz.class_eval do
      protected

      def authenticate_request!
        jwt = get_jwt(request.headers)
        auth_helper = ArtsyAuthToken.new(jwt)
        @current_user = auth_helper.current_user
      rescue JWT::DecodeError # includes verification error too
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      end

      def valid_admin?(token)
        auth_helper = ArtsyAuthToken.new(token)
        if auth_helper.admin?
          @current_user = auth_helper.current_user
          true
        else
          false
        end
      end

      private

      def get_jwt(headers)
        headers['Authorization']&.split(' ')&.last
      end
    end
  end
end

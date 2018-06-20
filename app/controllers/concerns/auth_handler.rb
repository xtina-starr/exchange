module AuthHandler
  def self.included(clazz)
    clazz.class_eval do
      protected

      def authenticate_request!
        unless user_id_in_token?
          render json: { errors: ['Not Authenticated'] }, status: :unauthorized
          return
        end
        @current_user = auth_token.with_indifferent_access.merge(id: auth_token[:sub])
      rescue JWT::DecodeError # includes verification error too
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      end

      private

      def http_token
        @http_token ||= request.headers['Authorization']&.split(' ')&.last
      end

      def auth_token
        @auth_token ||= decode_token.with_indifferent_access
      end

      def user_id_in_token?
        http_token && auth_token && auth_token['sub']
      end

      def decode_token
        JWT.decode(http_token, Rails.application.config_for(:jwt)['hmac_secret'], true, algorithm: 'HS256')[0]
      end
    end
  end
end

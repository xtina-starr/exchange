module AuthHandler
  def self.included(clazz)
    clazz.class_eval do
      protected

      def authenticate_request!
        jwt = get_jwt(request.headers)
        decoded_jwt = decode_token(jwt).with_indifferent_access
        @current_user = get_current_user(decoded_jwt)
      rescue JWT::DecodeError # includes verification error too
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      end

      def valid_admin?(token)
        decoded_jwt = decode_token(token).with_indifferent_access
        if admin_access?(decoded_jwt)
          @current_user = get_current_user(decoded_jwt)
          true
        else
          false
        end
      end

      private

      def get_jwt(headers)
        headers['Authorization']&.split(' ')&.last
      end

      def get_current_user(token)
        token.merge(id: token[:sub])
      end

      def decode_token(jwt)
        JWT.decode(jwt, Rails.application.config_for(:jwt)['hmac_secret'], true, algorithm: 'HS256')[0]
      end

      def admin_access?(decoded_token)
        decoded_token[:roles].include? 'sales_admin'
      end
    end
  end
end

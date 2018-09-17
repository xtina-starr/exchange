module ErrorHandler
  def self.included(clazz)
    clazz.class_eval do
      rescue_from StandardError do |exception|
        render json: { errors: [Types::ApplicationErrorType.from_exception(exception)] }, status: :internal_server_error
      end

      rescue_from ActionController::ParameterMissing do |exception|
        render json: { errors: [exception.param => 'is required'] }, status: :bad_request
      end

      rescue_from ActiveRecord::RecordNotFound do |exception|
        render json: { errors: ['not found' => exception.to_s] }, status: :not_found
      end

      rescue_from Errors::AuthError do |exception|
        render json: { errors: [Types::ApplicationErrorType.from_application(exception)] }, status: :unauthorized
      end

      rescue_from ::Errors::ValidationError do |exception|
        render json: { errors: [Types::ApplicationErrorType.from_application(exception)] }, status: :bad_request
      end
    end
  end
end

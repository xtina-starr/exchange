module ErrorHandler
  def self.included(clazz)
    clazz.class_eval do
      rescue_from ActionController::ParameterMissing do |exception|
        render json: { errors: [ exception.param => "is required" ] }, status: :bad_request
      end
    
      rescue_from ActiveRecord::RecordNotFound do |exception|
        render json: { errors: [ 'not found' => exception.to_s ] }, status: :not_found
      end

      rescue_from ::Errors::OrderError do |exception|
        render json: { errors: [ 'failed_request' => exception.to_s ] }, status: :bad_request
      end
    end
  end
end

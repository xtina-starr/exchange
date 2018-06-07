class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do |exception|
    render json: { errors: [ exception.param => "is required" ] }, status: 422
  end
end

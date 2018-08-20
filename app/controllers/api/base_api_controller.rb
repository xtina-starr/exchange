module Api
  class BaseApiController < ApplicationController
    skip_before_action :require_artsy_authentication
    before_action :authenticate_request!
    protect_from_forgery with: :null_session
  end
end

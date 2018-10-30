module Api
  class BaseApiController < ApplicationController
    skip_before_action :require_artsy_authentication
    skip_before_action :verify_authenticity_token
    before_action :authenticate_request!
  end
end

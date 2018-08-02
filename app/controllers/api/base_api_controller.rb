module Api
  class BaseApiController < ApplicationController
    skip_before_action :require_artsy_authentication
    before_action :authenticate_request!
  end
end

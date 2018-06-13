class ApplicationController < ActionController::API
  include ErrorHandler
  include AuthHandler

  attr_reader :current_user

  before_action :authenticate_request!
end

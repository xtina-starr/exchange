class ApplicationController < ActionController::Base
  include ErrorHandler
  include AuthHandler
  include ArtsyAuth::Authenticated

  attr_reader :current_user
  before_action :set_paper_trail_whodunnit

  def authorized_artsy_token?(token)
    if ::ArtsyAdminAuth.valid?(token)
      @current_user ||= ::ArtsyAdminAuth.get_user_id(token)
      true
    else
      false
    end
  end
end

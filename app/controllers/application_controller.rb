class ApplicationController < ActionController::Base
  include ErrorHandler
  include AuthHandler
  include ArtsyAuth::Authenticated
  alias authorized_artsy_token? valid_admin?

  attr_reader :current_user
  before_action :set_paper_trail_whodunnit
end

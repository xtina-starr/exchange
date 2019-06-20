# typed: true
class ApplicationController < ActionController::Base
  include ErrorHandler
  include AuthHandler
  include ArtsyAuth::Authenticated
  alias authorized_artsy_token? valid_admin?

  attr_reader :current_user
  before_action :set_paper_trail_whodunnit
  before_action :set_current_user_for_error_reporting

  def set_current_user_for_error_reporting
    Raven.user_context(current_user: current_user) if current_user.present?
  end

  def admin_display_in_eastern_timezone
    Time.zone = 'Eastern Time (US & Canada)'
  end
end

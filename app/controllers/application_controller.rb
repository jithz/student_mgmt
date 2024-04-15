class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(reource)
    admin_dashboard_path
  end
end

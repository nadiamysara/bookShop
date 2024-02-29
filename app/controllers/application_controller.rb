class ApplicationController < ActionController::Base

  #alert for admin from cancancan
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
end

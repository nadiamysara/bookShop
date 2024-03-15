class ApplicationController < ActionController::Base

  #adding name to devise User
  before_action :configure_permitted_parameters, if:  :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

  #alert for admin from cancancan
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
end

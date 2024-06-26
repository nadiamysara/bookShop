class ApplicationController < ActionController::Base
  #for error when redirect from securepay
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  #adding name to devise User
  before_action :configure_permitted_parameters, if:  :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone])
    end

  #alert for admin from cancancan
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
end

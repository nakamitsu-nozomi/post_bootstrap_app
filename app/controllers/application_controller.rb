class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickrname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_icon])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:user_icon])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_icon])
  end


end

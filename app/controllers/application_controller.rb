class ApplicationController < ActionController::Base
  def  configure_permitted_parameters
    devise_parameter_sanitizer.permmit(:signed_up, keys: [:nickname])
  end  
end

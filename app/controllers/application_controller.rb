class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to "/projects"
  end
  
  def after_sign_in_path_for(resource)
  stored_location_for(resource) || projects_path
	end

 before_filter :configure_permitted_parameters, if: :devise_controller?
  protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :nombres, :apellidos, :apodo)}
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, 
              :password_confirmation, :current_password, :nombres, :apellidos, :apodo, :photo)}
        end
  
end

class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  
  def after_sign_in_path_for(resource)
		stored_location_for(resource) || root_path
	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :code])
  end

end

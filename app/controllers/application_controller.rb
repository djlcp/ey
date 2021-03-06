class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

	def authenticate_inviter!
  	if user_signed_in?
  		unless current_user.admin? or current_user.hr?
  			redirect_to root_url, :alert => "Access Denied"
  		end
  	end
  	super
	end

  def after_invite_path_for(resource)
    hr_users_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password) }
    devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :email, :role, :admin, :is_manager, :join_date, :manager_id, :counsellor_id])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name])
  end
end

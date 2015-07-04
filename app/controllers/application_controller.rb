class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  	layout "login_layout"
  	protect_from_forgery with: :null_session
  #before_filter :authenticate_user!

private
# Overwriting the sign_out redirect path method
	def after_sign_out_path_for(resource_or_scope)
		root_path
	end

protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    new_user_session_path
  end
end
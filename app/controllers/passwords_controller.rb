class PasswordsController < Devise::PasswordsController
	layout "login_layout"

	def new
    super
  end

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
        if successfully_sent?(resource)
          result = [:status => "Success", :message => "Password Emailed successfully"]
              render json: result
        else
          result = [:status => "Error", :message => "Invalid Credential"]
            render json: result
        end
  end

  def edit
    super
  end

  def update
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

 protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    new_user_session_path
  end

end
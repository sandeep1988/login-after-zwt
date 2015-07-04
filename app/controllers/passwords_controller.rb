class PasswordsController < Devise::PasswordsController
	layout "login_layout"

	def new
    super
  end

  # def create
  #   if User.all.collect(&:email).include? params[:user][:email]
  #     super
  #   else 
  #     result = [:status => "Error", :message => "Invalid Email"]
  #     render json: result
  #     end
  # end

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
            if successfully_sent?(resource)
              result = [:status => "Success", :message => "Successfully sent Email"]
              render json: result
            else
              result = [:status => "Error", :message => "Invalid Credential"]
              render json: result
            end
  end

  def edit
    super
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
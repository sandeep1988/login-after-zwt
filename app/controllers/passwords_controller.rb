class PasswordsController < Devise::PasswordsController
	layout "login_layout"

	def new
    super
  end

  def create
    #super
    if User.all.collect(&:email).include? params[:username]
      redirect_to  new_user_password_path  
    else 
      redirect_to root_path
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
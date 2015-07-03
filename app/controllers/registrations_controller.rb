class RegistrationsController  < Devise::RegistrationsController
	def new
    super
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Deliver the signup email
      UserMailer.welcome_email(@user).deliver
      redirect_to dashboard_path
    else
      render :action => 'new'
    end
  end

  def update
    super
  end

def edit
  super
end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

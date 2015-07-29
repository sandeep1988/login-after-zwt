class RegistrationsController  < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
	def new
    super
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Deliver the signup email
      UserMailer.welcome_email(@user).deliver
      redirect_to new_user_session_path
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

  def destroy
    super
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :e_status, :v_firstname, :v_lastname, :v_im_skype, :v_im_password, :v_gmail, :v_linkedin_url, :v_phone, :e_type)
    end

  protected
     def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:v_firstname, :v_lastname, :email, :password, :v_im_skype, :v_im_password, :v_phone, :v_gmail, :v_linkedin_url, :v_phone, :e_type)
      end

     devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:v_firstname,
          :v_lastname, :v_im_skype, :v_im_password, :v_phone, :email, :password, :v_gmail, :v_linkedin_url)
      end
    end


 private

  def sign_up_params
    params.require(:user).permit(:v_firstname, :v_lastname, :email, :password, :v_im_skype, :v_im_password, :v_phone, :v_gmail, :v_linkedin_url, :v_phone, :e_type)
  end

private
  def account_update_params
    params.require(:user).permit(:v_firstname, :v_lastname, :email, :password, :v_im_skype, :v_im_password, :v_phone, :v_gmail, :v_linkedin_url, :v_phone, :e_type)
  end

  def after_sign_up_path_for(resource)
    new_user_session_path # Or :prefix_to_your_route
  end

protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

  end

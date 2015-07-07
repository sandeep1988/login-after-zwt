class RegistrationsController  < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  # layout "application", only: [:edit, :update, :create, :new]
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
   # self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
   #  prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
   #  resource_updated = update_resource(resource, account_update_params)
   #  yield resource if block_given?
   #  if resource_updated
   #    if is_flashing_format?
   #      flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
   #        :update_needs_confirmation : :updated
   #      set_flash_message :notice, flash_key
   #    end
   #    sign_in resource_name, resource, bypass: true
   #    respond_with resource, location: after_update_path_for(resource)
   #  else
   #    clean_up_passwords resource
   #    respond_with resource
    #end
  end

  def edit
    super
  end

  def destroy
      redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :e_status, :v_firstname, :v_lastname, :v_im_skype, :v_im_password, :v_gmail, :v_linkedin_url, :v_phone, :e_type)
    end


  protected
     def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:v_firstname, :v_lastname, :v_im_skype, :v_im_password, :v_phone, :v_gmail, :v_linkedin_url)
      end
     devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:v_firstname,
          :v_lastname, :v_im_skype, :v_im_password, :v_phone, :email, :password, :v_gmail, :v_linkedin_url)
      end
    end

  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

 private

  def sign_up_params
    params.require(:user).permit(:v_firstname, :v_lastname, :email, :password, :v_im_skype, :v_im_password, :v_phone, :v_gmail, :v_linkedin_url)
  end

private
  def account_update_params
    params.require(:user).permit(:v_firstname, :v_lastname, :email, :password, :v_im_skype, :v_im_password, :v_phone, :v_gmail, :v_linkedin_url, :v_phone, :e_type)
  end

  end

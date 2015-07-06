class PasswordsController < Devise::PasswordsController

	def new
    super
  end

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
        if successfully_sent?(resource)
          result = [:status => "Success", :message => "Password Emailed successfully"]
              render json: result
        else
          result = [:status => "Error", :message => "Invalid Email"]
            render json: result
        end
  end

  def edit
    super
  end

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_navigational_format?

      result = [:status => "Success", :success_url => root_path ]
      render json: result
      #respond_with resource, :location => after_resetting_password_path_for(resource)
    else
      result = [:status => "Error", :message => "Please enter the same Password ."]
      render json: result 
      #respond_with resource
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

 protected
    # The path used after sending reset password instructions
   def after_resetting_password_path_for(resource)
     root_path(resource)
   end

    # Check if a reset_password_token is provided in the request
    def assert_reset_token_passed
        if params[:reset_password_token].blank?
            set_flash_message(:error, :no_token)
            redirect_to new_session_path(resource_name)
        end
    end

    # Check if proper Lockable module methods are present & unlock strategy
    # allows to unlock resource on password reset
    def unlockable?(resource)
        resource.respond_to?(:unlock_access!) &&
        resource.respond_to?(:unlock_strategy_enabled?) &&
        resource.unlock_strategy_enabled?(:email)
    end
end
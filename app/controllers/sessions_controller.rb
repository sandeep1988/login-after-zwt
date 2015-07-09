class SessionsController < Devise::SessionsController
  # rescue_from ActiveRecord::RecordNotFound, with: :invalid_case
  def new
    flash[:notice] = "Test flash message"
    super
  end

  def create
    # check user
  	if user_signed_in?
  		redirect_to authenticated_root_path
  	else
      flash[:fail] = 'Invalid Username or Password'
      redirect_to root_path
    end
  end

  def edit
  	super
  end

  def destroy
  	super
  end

# private
#       def invalid_case
#       logger.error "Attempt to access invalid case #{params[:id]}"
#       redirect_to root_path, notice: 'Invalid case'
#       end

end

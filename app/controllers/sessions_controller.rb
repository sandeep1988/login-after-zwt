class SessionsController < Devise::SessionsController
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
      flash[:action] = "login"
      redirect_to root_path
    end
  end

  def edit
  	super
  end

  def destroy
  	super
  end
end

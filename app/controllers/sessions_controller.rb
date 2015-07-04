class SessionsController < Devise::SessionsController
	layout "login_layout"
def new
    super
 end

def create
  # check user
	if user_signed_in?
		redirect_to authenticated_root_path
	else
		redirect_to root_path, notice: "Invalid email or password"
	end
end

  def edit
  	super
  end

  def destroy
  	super
  end

end

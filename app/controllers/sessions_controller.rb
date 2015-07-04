class SessionsController < Devise::SessionsController
	layout "login_layout"
def new
    super
 end

def create
  # check user
	if user_signed_in?
		#redirect_to authenticated_root_path
    result = [:status => "Success", :success_url => authenticated_root_path ]
    render json: result
	else
    #redirect_to root_path
    result = [:status => "Error", :message => "Invalid Credential"]
    render json: result
  end
end

  def edit
  	super
  end

  def destroy
  	super
  end

end

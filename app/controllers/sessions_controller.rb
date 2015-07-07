class SessionsController < Devise::SessionsController
def new
    super
 end

def create
  # check user
	if user_signed_in?
		redirect_to authenticated_root_path
    ### comment this for remove ajax
    # result = [:status => "Success", :success_url => authenticated_root_path ]
    # render json: result
	else
    redirect_to root_path
    ### comment this for remove ajax
    # result = [:status => "Error", :message => "Invalid Credential"]
    # render json: result
  end
end

  def edit
  	super
  end

  def destroy
  	super
  end


end

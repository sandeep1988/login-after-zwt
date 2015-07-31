module RegistrationsHelper
	def user_email(user)
		user.email if user && user.email.present?
	end

	def user_fullname(user)
		if user_signed_in?
	 		"#{current_user.v_firstname} #{current_user.v_lastname}"
	 	end
	  end
end
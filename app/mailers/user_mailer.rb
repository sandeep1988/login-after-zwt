class UserMailer < ApplicationMailer
	default from: 'testing.demo@gmail.com'
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

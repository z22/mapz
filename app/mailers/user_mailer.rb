class UserMailer < ActionMailer::Base
  default from: "donotreply@mapzapp.herokuapp.com"


  def welcome_email(user)
    @user = user
    @url = "http://mapzapp.herokuapp.com/"
    mail(:to => user.email, :subject => "Welcome to Mapz!")
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end

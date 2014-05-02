class SessionsController < ApplicationController
  skip_before_filter :require_user

  def new
  end


  def create
    # trying out omniauth-twitter using Railscasts
    # auth = request.env["omniauth.auth"]
    # user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    # session[:user_id] = user.id
    # redirect_to users_path, :notice => "Logged in!"

    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to home_index_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end

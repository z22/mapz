class SessionsController < ApplicationController
  skip_before_filter :require_user

  def new
  end


  def create
    # trying out omniauth-twitter using Railscasts
    # auth = request.env["omniauth.auth"]
    # user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    # session[:user_id] = user.id
    # redirect_to root_url, :notice => "Logged in!"

    #google
    #What data comes back from OmniAuth?
  #   auth = request.env["omniauth.auth"]
  # if auth
  #   #request a list of calendars
  #   @token = auth["credentials"]["token"]

#############################################

# Initialize Google+ API. Note this will make a request to the
# discovery service every time, so be sure to use serialization
# in your production code. Check the samples for more details.
# client = Google::APIClient.new
# client.authorization.access_token = @token
# plus = client.discovered_api('plus')
# result = client.execute(
#   :api_method => plus.people.get,
#   :parameters => {'email' => emails[0]}
#   )

# user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
# session[:user_id] = user.id
# redirect_to root_url, :notice => "Logged in!"

#############################################

#for google calendar
    # client = Google::APIClient.new
    # client.authorization.access_token = @token
    # service = client.discovered_api('calendar', 'v3')
    # result = client.execute(
    #   :api_method => service.calendar_list.list,
    #   :parameters => {'email' => },
    #   :headers => {'Content-Type' => 'application/json'})
    # user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    # session[:user_id] = user.id
    # session[:gcal_result] = result
    # redirect_to root_url, :notice => "Logged in!"

  # else

    #basic auth
    user = User.authenticate(params[:email], params[:password])
  # end
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
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

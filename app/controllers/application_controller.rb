class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  # before_filter :require_user

  #basic auth, used while working on app
  before_filter :site_login_required



  def require_user
    # x = User.where('SELECT COUNT(*) FROM users').count
    # if x == 0
    #   redirect_to sign_up_path
    # else
      redirect_to log_in_path unless current_user
    # end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  def site_login_required
    authenticate_or_request_with_http_basic do |username, password|
      username == "m" && password == "z"
    end
  end

end

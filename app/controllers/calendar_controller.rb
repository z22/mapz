class CalendarController < ApplicationController
  def index
    @gcal_result = session[:gcal_result]
  end
end

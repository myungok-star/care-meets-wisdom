class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_volunteer
   @current_volunteer ||= Volunteer.find(session[:volunteer_id]) if session[:volunteer_id]
  end
  helper_method :current_volunteer

  def authorize
   redirect_to '/volunteers/login' unless current_volunteer
  end

end

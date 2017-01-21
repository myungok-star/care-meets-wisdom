class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_volunteer
   @current_volunteer ||= Volunteer.find(session[:volunteer_id]) if session[:volunteer_id]
  end
  helper_method :current_volunteer

  def authorize
   redirect_to '/volunteers/login' unless current_volunteer
  end

  def current_care_group
   @current_care_group ||= CareGroup.find(session[:care_group_id]) if session[:care_group_id]
  end
  helper_method :current_care_group

  def authorize
   redirect_to '/care_groups/login' unless current_care_group
  end

end

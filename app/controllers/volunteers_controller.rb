class VolunteersController < ApplicationController

  def new
  end

  def create
    volunteer = Volunteer.new(volunteer_params)
   if volunteer.save
     session[:volunteer_id] = volunteer.id
     redirect_to '/'
   else
     redirect_to '/volunteers/signup'
   end
  end

private

  def volunteer_params
    params.require(:volunteer).permit(:name, :email, :password, :password_confirmation)
  end

end

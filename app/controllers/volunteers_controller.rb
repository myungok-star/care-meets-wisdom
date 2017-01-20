class VolunteersController < ApplicationController

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
   if @volunteer.save
     session[:volunteer_id] = @volunteer.id
     redirect_to volunteer_path(@volunteer)
   else
     redirect_to '/volunteers/signup'
   end
  end

  def show
    @volunteer = Volunteer.find_by_id(params[:id])
    @seniors = @volunteer.seniors.find_by_id(params[:id])
  end

private

  def volunteer_params
    params.require(:volunteer).permit(:name, :email, :password, :password_confirmation)
  end

end

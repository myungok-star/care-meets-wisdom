class VolunteersController < ApplicationController

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
   if @volunteer.save
     flash[:notice] = "Welcome to the Welcom Wisdom Site!"
     VolunteerMailer.welcome_email(@volunteer).deliver_now
     session[:volunteer_id] = @volunteer.id
     redirect_to '/volunteers/login'
   else
     flash[:notice] =
     @volunteer.errors.full_messages.join(", ")
     redirect_to '/volunteers/signup'
   end
  end

  def show
    @volunteer = Volunteer.find_by_id(params[:id])
  end


  def edit
    @volunteer = current_volunteer
  end

  def update
    @volunteer = Volunteer.find(session[:volunteer_id])
    if @volunteer.update_attributes(volunteer_params)
      flash[:notice] = "Your profile information has been updated."
      redirect_to volunteer_path(@volunteer)
    else
      render 'edit'
    end
  end


private

  def volunteer_params
    params.require(:volunteer).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

end

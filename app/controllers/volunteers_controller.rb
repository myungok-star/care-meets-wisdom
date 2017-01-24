class VolunteersController < ApplicationController

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
   if @volunteer.save
     session[:volunteer_id] = @volunteer.id
     redirect_to '/volunteers/login'
   else
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
      redirect_to volunteer_path(@volunteer)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(session[:volunteer_id]).destroy
    session[:volunteer_id] = nil
    redirect_to edit_volunteer_path(@volunteer)
  end


private

  def volunteer_params
    params.require(:volunteer).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

end

class VolunteerSessionsController < ApplicationController

  def index
  end

  def new
    end

    def create
      @volunteer = Volunteer.find_by_email(params[:email])
   # If the user exists AND the password entered is correct.
      if @volunteer && @volunteer.authenticate(params[:password])
     # Save the user id inside the browser cookie. This is how we keep the user
     # logged in when they navigate around our website.
      session[:volunteer_id] = @volunteer.id
      redirect_to volunteer_path(@volunteer)
      else
   # If user's login doesn't work, send them back to the login form.
      flash[:notice] = "Incorrect email or password"
      redirect_to '/volunteers/login'
      end
    end

    def destroy
      session[:volunteer_id] = nil
      redirect_to '/'
    end

end

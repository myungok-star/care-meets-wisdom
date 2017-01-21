class CareGroupSessionsController < ApplicationController

  def new
   end

   def create
     @care_group = CareGroup.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if @care_group && @care_group.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:care_group_id] = @care_group.id
      redirect_to care_group_path(@care_group)
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/care_groups/login'
    end
  end

  def destroy
    session[:care_group_id] = nil
    redirect_to '/'
  end

end

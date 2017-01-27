class CareGroupsController < ApplicationController

  def index
    @care_groups = CareGroup.all
  end

  def new
    # TODO: I'm trying to go to care_groups/sign_up but It's rerouting me to care_groups/:id (show). This needs to be fixed. Care groups can't sign up at all.
  end

  def create
    @care_group = CareGroup.new(care_group_params)
      if @care_group.save
        flash[:notice] = "Welcome to the Welcom Wisdom Site!"
        session[:care_group_id] = @care_group.id
        redirect_to '/care_groups/login'
      else
        flash[:notice] =
        @care_group.errors.full_messages.join(", ")
        redirect_to '/care_groups/signup'
      end
  end

  def show
    @care_group = CareGroup.find_by_id(params[:id])
  end

  def show_seniors
    @care_group = CareGroup.find_by_id(params[:care_group_id])
  end

  def edit
    @care_group = current_care_group
  end

  def update
    @care_group = CareGroup.find(session[:care_group_id])
    if @care_group.update_attributes(care_group_params)
      flash[:notice] = "Your profile information has been updated."
      redirect_to care_group_path(@care_group)
    else
      render 'edit'
    end
  end

  private

  def care_group_params
    params.require(:care_group).permit(:name, :email, :password, :password_confirmation, :photo, :location, :about, :senior_id)
  end

end

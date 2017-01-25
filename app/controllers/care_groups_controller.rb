class CareGroupsController < ApplicationController

  def index
    @care_groups = CareGroup.all
  end

  def new
  end

  def create
    @care_group = CareGroup.new(care_group_params)
      if @care_group.save
        session[:care_group_id] = @care_group.id
        redirect_to '/care_groups/login'
      else
        redirect_to '/care_groups/signup'
      end
  end

  def show
    @care_group = CareGroup.find_by_id(params[:id])
    @seniors = @care_group.seniors.all
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
      redirect_to care_group_path(@care_group)
    else
      render 'edit'
    end
  end

  def destroy
    CareGroup.find(session[:care_group_id]).destroy
    session[:care_group_id] = nil
    redirect_to edit_care_group_path(@care_group)
  end

  private

  def care_group_params
    params.require(:care_group).permit(:name, :email, :password, :password_confirmation, :photo, :location, :about)
  end

end

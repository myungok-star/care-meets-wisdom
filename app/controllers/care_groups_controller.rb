class CareGroupsController < ApplicationController

  def new
  end

  def create
    care_group = Care_group.new(care_group_params)
      if care_group.save
        session[:care_group_id] = care_group.id
        redirect_to '/care_groups/login'
      else
        redirect_to '/care_groups/signup'
      end
  end

  private

  def care_group_params
    params.require(:care_group).permit(:name, :email, :password, :password_confirmation, :photo)
  end

end

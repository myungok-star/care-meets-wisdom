class SeniorsController < ApplicationController
 def index
   @seniors = Senior.all
 end
 def new
   @senior = Senior.new
 end

  def create
    @senior = Senior.new(senior_params)
    @senior.care_group = current_care_group
    @care_group = current_care_group
     if @senior.save
       redirect_to care_group_path(current_care_group)
     end
  end

  def edit
    @senior = Senior.find_by_id(params[:id])
    @care_group = current_care_group
    @current_care_group_id = params[:care_group_id]
  end

  def show
    @care_group = current_care_group
    @current_care_group_id = params[:care_group_id]
    @senior = Senior.find_by_id(params[:id])
  end

  def update
    @care_group = current_care_group
    @current_care_group_id = params[:care_group_id]
    @senior = Senior.find_by_id(params[:id])
    if @senior.update_attributes(senior_params)
      redirect_to all_care_group_seniors_path(@care_group, @senior)
    else
      redirect_to edit_care_group_senior_path(@care_group, @senior)
    end
  end

  def destroy
    @senior = Senior.find_by_id(params[:id])
    if @senior.destroy
      redirect_to care_group_path(current_care_group)
    end
  end

  private
  def senior_params
    params.require(:senior).permit(:name, :location, :about, :interests, :care_group_id)
end
end

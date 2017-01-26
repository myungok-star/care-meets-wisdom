class SeniorsController < ApplicationController
 # def index
 #   @seniors = Senior.all
 #   @care_group = current_care_group
 #   @current_care_group_id = params[:care_group_id]
 # end
 def new
   @senior = Senior.new
 end

  def create
    @care_group = current_care_group
    @senior = Senior.new(senior_params)
    @senior.care_group_id = current_care_group.id
     if @senior.save
       flash[:notice] = "You have successfully created a new senior member!"
       redirect_to all_care_group_seniors_path(current_care_group)
     else
       flash[:error] = @senior.errors.full_messages.join(", ")
     end
  end

  def edit
    @senior = Senior.find_by_id(params[:id])
    @care_group = current_care_group
    @current_care_group_id = params[:care_group_id]
  end

  def show
    @volunteer = current_volunteer
    @care_group = current_care_group
    @current_care_group_id = params[:care_group_id]

    @senior = Senior.find_by_id(params[:id])

  end

  def update
    @care_group = current_care_group
    @current_care_group_id = params[:care_group_id]
    @senior = Senior.find_by_id(params[:id])
    if @senior.update_attributes(senior_params)
      flash[:notice] = "Your member information has been updated."
      redirect_to all_care_group_seniors_path(@care_group, @senior)
    else
      flash[:notice] =
      @senior.errors.full_messages.join(", ")
      redirect_to edit_care_group_senior_path(@care_group, @senior)
    end
  end

  def destroy
    @care_group = current_care_group
    @current_care_group_id = params[:care_group_id]
    @senior = Senior.find_by_id(params[:id])
    if @senior.destroy
      flash[:notice] = "Your member has been removed."
      redirect_to all_care_group_seniors_path(current_care_group)
    end
  end

  private
  def senior_params
    params.require(:senior).permit(:name, :location, :about, :interests, :care_group_id)
end
end

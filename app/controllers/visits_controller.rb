class VisitsController < ApplicationController

def create
  @visit = Visit.new
  @visit.senior_id = Senior.find_by_id(params[:senior_id]).id
  @visit.volunteer_id = current_volunteer.id
  @visit.pending = true
  @visit.approved = false
  @care_group = @visit.senior.care_group
  # @volunteer = @visit.volunteer
  @visit.save
  redirect_to volunteer_path(current_volunteer)
end

def show
    @visit= Visit.find_by_id(params[:id])
end

def approve
  @visit = Visit.find_by_id(params[:id])
 @volunteer = @visit.volunteer
 @care_group = current_care_group
 @visit.update_attributes(approved: true, pending: false)
 if @visit.save
   redirect_to care_group_path(current_care_group)
end
end

def destroy
  @visit = Visit.find_by_id(params[:id])
  @volunteer = Volunteer.find(@visit.volunteer_id)
  # @visit.destroy
    if @visit.destroy
      redirect_to volunteer_path(current_volunteer)
    end
end

end

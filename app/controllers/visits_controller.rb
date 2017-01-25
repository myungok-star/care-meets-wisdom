class VisitsController < ApplicationController

def create
  @visit = Visit.new
  @visit.senior = Senior.find_by_id(params[:senior_id])
  @visit.volunteer = current_volunteer
  @visit.pending = true
  @visit.approved = false
  @visit.visit_complete = false
  @care_group = @visit.senior.care_group
  @volunteer = @visit.volunteer
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

def complete
  @senior = Senior.find_by_id(params[:senior_id])
  @visit = @senior.visits.find_by_id(params[:id])

  @visit.update_attributes(visit_complete: true, approved: false)
  if @visit.save
    redirect_to care_group_path(current_care_group)
  end
end

def destroy
  @visit = Visit.find_by_id(params[:id])
  @volunteer = Volunteer.find(@visit.volunteer_id)
  @senior = Senior.find_by_id(params[:senior_id])
  # @visit.destroy
    if @visit.destroy
      if current_volunteer
        redirect_to volunteer_path(current_volunteer)

    elsif current_care_group
      redirect_to care_group_path(current_care_group)
        end
    end
end

end

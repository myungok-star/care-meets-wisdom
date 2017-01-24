class VisitsController < ApplicationController

def new
  @visit = Visit.new
  @visit.senior = Senior.find_by_id(params[:senior_id])
  @visit.volunteer = current_volunteer
  @visit.pending = true
  @visit.approved = false
  @care_group = @visit.senior.care_group
  @volunteer = @visit.volunteer
  @visit.save
  redirect_to volunteer_path(current_volunteer)
end

def destroy
  @visit = Visit.find_by_id(params[:id])
  @volunteer = @visit.volunteer
  @visit.destroy
    if @visit.destroy
      redirect_to volunteer_path(current_volunteer)
    end
end
end

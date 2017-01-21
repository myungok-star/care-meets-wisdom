# class VisitsController < ApplicationController
#
#   def create
#     end
#
#     def new
#       @visit = Visit.new
#       @visit.senior = Senior.find_by_id(params[:senior_id])
#       @visit.volunteer = current_volunteer
#       @rental.pending = true
#       @rental.approved = false
#        @care_group = @visit.senior.care_group
#        @volunteer = @visit.volunteer
#       @visit.senior.care_group.first
#       @visit.save
#         # if @visit.save
#         #   flash[:notice] = "Your visit invite has been sent to the volunteer."
#         #   VolunteerMailer.pending_visit(@volunteer).deliver_now
#         #   CareGroupMailer.scheduled_visit(@care_group).deliver_now
#         # end
#         # redirect_to care_group_path(current_care_group)
#     end
#
#     def edit
#     end
#
#     def show
#       @visit = Visit.find_by_id(params[:id])
#     end
#
#     def update
#       @rental = Rental.find_by_id(params[:id])
#       @rental.update_attributes(done_renting: true)
#         if @rental.save
#           flash[:notice] = "You have successfully ended the Pup Share."
#           redirect_to owner_path(current_owner)
#         end
#       end
#
#     def approve
#       @rental = Rental.find_by_id(params[:id])
#       @sitter = @rental.sitter
#       @owner = current_owner
#       @rental.update_attributes(approved: true, pending: false)
#       if @rental.save
#         flash[:notice] = "You have approved #{@sitter.first}."
#         SitterMailer.rental_approved(@sitter, @owner, @rental).deliver_now
#         redirect_to owner_path(current_owner)
#       end
#     end
#
#     def destroy
#       @rental = Rental.find_by_id(params[:id])
#       @sitter = @rental.sitter
#       @rental.destroy
#         if @rental.destroy
#           flash[:notice] = "Your Pup Share request has been canceled."
#           SitterMailer.declined_rental(@sitter, @rental).deliver_now
#           redirect_to dogs_path
#         end
#     end
#   end

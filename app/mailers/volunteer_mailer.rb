class VolunteerMailer < ApplicationMailer

  default from: 'welcome.wisdom2017@gmail.com'

  def welcome_email(volunteer)
      @volunteer = volunteer
      mail(to: @volunteer.email, subject: 'Welcome to Welcome Wisdom Site')
    end

end

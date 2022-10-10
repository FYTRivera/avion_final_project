class ApprovalMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.approval_mailer.approval_made.subject
  #
  def approval_made
    @meeting = params[:meeting]
    @doctor = User.find(@meeting.user_id)
    @greeting = "Your session at RIVClinic with Dr. #{@doctor.first_name} #{@doctor.last_name} from #{@meeting.start_time.strftime('%Y-%m-%d | %I:%M %p')} to #{@meeting.end_time.strftime('%Y-%m-%d | %I:%M %p')} has been approved!"
    
    mail(to: @meeting.client_email, subject: "Approved Session")
  end
end

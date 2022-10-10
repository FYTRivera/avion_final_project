class BookedSessionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booked_session_mailer.booked_session.subject
  #
  def booked_session
    @meeting = params[:meeting]
    @doctor = User.find(@meeting.user_id)
    @greeting = "Hi, you have applied for a session with Dr. #{@doctor.first_name} #{@doctor.last_name} from #{@meeting.start_time.strftime('%I:%M %p | %Y-%m-%d')} to #{@meeting.end_time.strftime('%I:%M %p | %Y-%m-%d')}"
    


    mail(to: @meeting.client_email, subject: "Applied for Session")
  end
end

class BookedSessionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booked_session_mailer.booked_session.subject
  #
  def booked_session
    @meeting = params[:meeting]
    @doctor = User.find(@meeting.user_id)
    @greeting = "Hi, you have applied for a session with Dr. #{@doctor.last_name}"
    


    mail(to: @meeting.client_email, subject: "Applied for Session")
  end
end

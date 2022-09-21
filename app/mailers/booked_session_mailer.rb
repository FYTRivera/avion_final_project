class BookedSessionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booked_session_mailer.booked_session.subject
  #
  def booked_session
    @greeting = "Hi"
    @meeting = params[:meeting]


    mail(to: @meeting.client_email, subject: "Booked Session")
  end
end

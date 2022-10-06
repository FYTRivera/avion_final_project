class DoctorNewSessionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.doctor_new_session_mailer.new_session_applied.subject
  #
  def new_session_applied
    @meeting = params[:meeting]
    @doctor = User.find(@meeting.user_id)
    @client = User.find_by(email: @meeting.client_email)
    @greeting = "Hi, #{@client.first_name} #{@client.last_name} applied for a session on #{@meeting.start_time.strftime('%Y-%m-%d | %I:%M %p')} to #{@meeting.end_time.strftime('%Y-%m-%d | %I:%M %p')}"
    


    mail(to: @doctor.email, subject: "Someone Applied for a Session")
  end
end

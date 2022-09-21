# Preview all emails at http://localhost:3000/rails/mailers/booked_session_mailer
class BookedSessionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booked_session_mailer/booked_session
  def booked_session
    BookedSessionMailer.booked_session
  end

end

# Preview all emails at http://localhost:3000/rails/mailers/doctor_new_session_mailer
class DoctorNewSessionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/doctor_new_session_mailer/new_session_applied
  def new_session_applied
    DoctorNewSessionMailer.new_session_applied
  end

end

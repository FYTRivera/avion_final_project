# Preview all emails at http://localhost:3000/rails/mailers/approval_mailer
class ApprovalMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/approval_mailer/approval_made
  def approval_made
    ApprovalMailer.approval_made
  end

end

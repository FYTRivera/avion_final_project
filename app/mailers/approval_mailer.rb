class ApprovalMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.approval_mailer.approval_made.subject
  #
  def approval_made
    @greeting = "Your session has been approved!"
    @meeting = params[:meeting]
    
    mail(to: @meeting.client_email, subject: "Approved Session")
  end
end

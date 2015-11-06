# Preview all emails at http://localhost:3000/rails/mailers/email_send
class EmailSendPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/email_send/mail_send
  def mail_send
    EmailSend.mail_send
  end

end

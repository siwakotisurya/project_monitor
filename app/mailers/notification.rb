class Notification < ApplicationMailer
  default from: "testingrailsapp@gmail.com"
  layout 'mailer'
  def email_sender(email)
     mail(:to => email,:subject => "Your Website is currently down") do |format|
    format.text { render :text => body }
  end
end

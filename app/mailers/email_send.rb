class EmailSend < ApplicationMailer

  default from: "railsmailer724@gmail.com"

  def mail_send(email)
    mail(:to => email,:subject => "Your Website is currently down") do |format|
      format.text { render :text => "Seems Like Your website is not up" }
    end
  end
end

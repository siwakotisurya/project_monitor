require 'test_helper'

class EmailSendTest < ActionMailer::TestCase
  test "mail_send" do
    mail = EmailSend.mail_send
    assert_equal "Mail send", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

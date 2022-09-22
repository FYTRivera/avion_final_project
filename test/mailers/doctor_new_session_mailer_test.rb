require "test_helper"

class DoctorNewSessionMailerTest < ActionMailer::TestCase
  test "new_session_applied" do
    mail = DoctorNewSessionMailer.new_session_applied
    assert_equal "New session applied", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

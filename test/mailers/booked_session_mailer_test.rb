require "test_helper"

class BookedSessionMailerTest < ActionMailer::TestCase
  test "booked_session" do
    mail = BookedSessionMailer.booked_session
    assert_equal "Booked session", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

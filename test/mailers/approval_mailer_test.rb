require "test_helper"

class ApprovalMailerTest < ActionMailer::TestCase
  test "approval_made" do
    mail = ApprovalMailer.approval_made
    assert_equal "Approval made", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

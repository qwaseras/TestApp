require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "registration_conformation" do
    mail = UserMailer.registration_conformation
    assert_equal "Registration conformation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

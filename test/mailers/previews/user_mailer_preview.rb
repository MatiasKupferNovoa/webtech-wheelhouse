class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.new(email_address: "mailtest@example.com")
    UserMailer.welcome(user)
  end
end

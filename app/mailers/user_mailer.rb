class UserMailer < ApplicationMailer

    default from: "noreply@domain.com"

  def registration_conformation(user)
    @greeting = "Hi"
      @user = user
      mail to: @user.email, subject: "Confirm your registration" 
  end
end


class UserMailer < ApplicationMailer
    default from: "ecomm@mail.com"

    def welcome_email(user)
        @user=user
        mail(to: @user.email, subject: "Welcome to our E-commerce Site")
    end
end

class UserMailer < Devise::Mailer

    helper :application # gives access to all helpers defined within `application_helper`.
    include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
    default template_path: 'devise/mailer' #

    default from: ENV['MAILGUN_SENDER']

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome')
    end


end


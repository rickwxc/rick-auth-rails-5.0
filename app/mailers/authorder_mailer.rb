class AuthorderMailer < Devise::Mailer

    helper :application # gives access to all helpers defined within `application_helper`.
    include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
    default template_path: 'mails/authorder' #

    default from: ENV['MAILGUN_SENDER']

    def send_order_email(order)
		@user = order.user
		@order  = order
        mail(to: @user.email, subject: 'Welcome')
    end


end


class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@rebooky.com'

  layout 'mailer'
end

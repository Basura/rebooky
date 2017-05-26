class InquiryMailer < ApplicationMailer
  def forward(inquiry)
    @user = inquiry.find_user
    @inquiry = inquiry

    mail(to: @user.email, from: @user.sendgrid_email_address, subject: inquiry.subject)
  end
end

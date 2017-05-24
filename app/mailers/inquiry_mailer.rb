class InquiryMailer < ApplicationMailer
  def forward(inquiry)
    @user = inquiry.find_user
    @inquiry = inquiry

    mail(to: @user.email, from: inquiry.from, subject: inquiry.subject)
  end
end

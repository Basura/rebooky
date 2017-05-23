class InquiryMailer < ApplicationMailer
  def forward(inquiry)
    @inquiry = inquiry

    mail(to: inquiry.property.user.email, from: inquiry.from, subject: inquiry.subject)
  end
end

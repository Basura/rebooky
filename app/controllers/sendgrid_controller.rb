class SendgridController < ApplicationController
  skip_before_action :verify_authenticity_token

  def mails
    inquiry = Inquiry.new(inquiry_params)
    if inquiry.save
      render plain: 'Sucess!!'
    else
      render plain: inquiry.errors.full_messages.join(', '), status: 422
    end
  ensure
    # Forward the inquiry even if it wasn't properly saved
    InquiryMailer.forward(inquiry).deliver_now if inquiry.find_user
  end

  private

  def inquiry_params
    { message: params.permit(:headers, :html, :text, :subject, :from, :to,
                             :attachments).to_h }
  end
end

class SendgridController < ApplicationController
  skip_before_action :verify_authenticity_token

  def mails
    inquiry = Inquiry.new(inquiry_params)
    inquiry.save!
    render plain: 'Sucess!!'
  end

  private

  def inquiry_params
    { message: params.permit(:headers, :html, :text, :subject, :from, :to, :attachments).to_h }
  end
end

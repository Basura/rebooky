class InquiriesController < ApplicationController
  def index
    @inquiries = policy_scope(Inquiry).page(params[:page]).per(50)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    authorize @inquiry
  end
end

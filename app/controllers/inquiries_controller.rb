class InquiriesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @inquiries = policy_scope(Inquiry).page(params[:page]).per(50)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    authorize @inquiry
  end
end

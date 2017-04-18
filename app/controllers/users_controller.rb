# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)

  def index
    @users = policy_scope(User.all)
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      redirect_to :users, notice: 'User successfully created'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      redirect_to :users, notice: 'User successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to :users, notice: 'User successfully destroy'
  end

  private

  def user_params
    params.require(:user).permit(policy(User).permitted_attributes).tap do |p|
      p[:password] = nil if p[:password] == ''
      p[:password_confirmation] = nil if p[:password_confirmation] == ''
    end
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end

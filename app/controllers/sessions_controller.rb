# frozen_string_literal: true

# class of sessions controller
class SessionsController < ApplicationController
  before_action :set_params, only: %i[create]
  before_action :find_user, only: %i[create]
  before_action :check_session, only: %i[new]

  include SessionsHelper

  def new; end

  def create
    if @user.present?
      session[:user_id] = @user.id

      redirect_to root_path, notice: 'Вы успешно вошли в аккаунт'
    else
      flash.now[:alert] = 'Неправильные никнейм или пароль'

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: 'Вы вышли из аккаунта'
  end

  def set_params
    @user_params = params.require(:sessions)
  end

  def find_user
    @user = User.find_by(nickname: @user_params[:nickname])&.authenticate(@user_params[:password])
  end

  def check_session
    redirect_to root_path if session[:user_id].present?
  end
end

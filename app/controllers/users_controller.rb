# frozen_string_literal: true

# class of users controller
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :new_user, only: %i[create]
  before_action :check_session, only: %i[new]

  after_action :clear_session, only: %i[destroy]

  include UsersHelper

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    redirect_to('/users/new', alert: 'Невалидные данные') and return if invalid_data?
    redirect_to('/users/new', alert: 'Данное имя занято') and return if User.find_by(nickname: user_params[:nickname]).present?

    respond_to do |format|
      if @user.save
        format.html { redirect_to(root_path, notice: 'Пользователь был успешно создан.') }

        session[:user_id] = @user.id
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    redirect_to(root_path, 'Вы не можете выполнить данное действие') and return if session[:user_id] != @user.id

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    redirect_to(root_path, 'Вы не можете выполнить данное действие') and return if session[:user_id] != @user.id

    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def invalid_data?
    user_params[:nickname].empty? || user_params[:password].empty?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :password)
  end

  def new_user
    @user = User.new(user_params)
  end

  def destroy_user
    @user.destroy
  end

  def check_session
    redirect_to root_path if session[:user_id].present?
  end

  def clear_session
    session.delete(:user_id)
  end
end

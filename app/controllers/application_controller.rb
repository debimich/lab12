# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  helper_method :current_user
  around_action :switch_locale

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

end

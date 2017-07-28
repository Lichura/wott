class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  before_action :set_locale

  helper_method :current_user

  def set_locale
  	I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
  	{ locale: I18n.locale }
  end

private
def current_user
  if session[:user_id]
   @current_user ||= User.find(session[:user_id]) 
  else
    User.new_guest
  end
end




end

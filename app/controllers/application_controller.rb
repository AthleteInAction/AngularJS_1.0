class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  before_filter :authenticate if Rails.env != 'development'

  before_filter :authorize

  def authenticate

    return false if session[:auth]

    authenticate_or_request_with_http_digest 'Application' do |name|

      session[:auth] = true if AUTH[name]

      AUTH[name]

    end

  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to root_url, alert: 'Not authorized' if current_user.nil?
  end

end
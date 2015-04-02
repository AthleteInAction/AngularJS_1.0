class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  before_filter :authenticate if !E.development?

  before_filter :api_authorize,:authorize

  def authenticate

    return false if session[:auth]

    authenticate_or_request_with_http_digest 'Application' do |name|

      session[:auth] = true if AUTH[name]

      AUTH[name]

    end

  end

  def current_user

    if user_table

      @current_user ||= User.find(session[:user_id]) if session[:user_id]

    else

      @current_user = nil

    end
    
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, flash: {warning: 'Not authorized'} if current_user.nil?
  end

  def api_authorize
    render json: {error: 'Not authorized'},status: 401 if current_user.nil?
  end

  def user_table

    clean = true

    begin

      User.new

    rescue

      session[:user_id] = nil
      clean = false

    end

    clean

  end
  helper_method :user_table

end
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :log_in_required, except: [:new, :create, :home]

  def logged_in?
    !!current_user
  end

  private

  def log_in_required
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end

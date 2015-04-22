class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    # this uses session[:user id] unless its nil - less server calls
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    
  end

  def authorize
    redirect_to :root, alert: 'You must be logged in to view this page' if current_user.nil?
  end

  # this allows the private method above to be used in views or elsewhere
  helper_method :current_user
  
end

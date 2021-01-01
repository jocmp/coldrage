class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= find_user
  end

  def current_user=(user)
    session[:user_id] = user.id
  end

  private

  def find_user
    if session[:user_id]
      User.find_by_id(session[:user_id])
    else
      User.new
    end
  end
end

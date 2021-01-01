class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= find_user
  end

  def current_user=(user)
    session[:current_user_id] = user.id
  end

  private

  def find_user
    User.find_by_id(session[:current_user_id]) || User.new
  end
end

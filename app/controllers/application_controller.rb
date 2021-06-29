class ApplicationController < ActionController::Base
  # @dynamic current_user
  helper_method :current_user

  def current_user
    @current_user ||= find_user
  end

  def current_user=(user)
    if user # remove to see null checking
      session[:current_user_id] = user.id
    end
  end

  private

  def find_user
    User.find_by(id: session[:current_user_id]) || User.new
  end
end

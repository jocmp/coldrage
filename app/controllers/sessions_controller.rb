# http://railscasts.com/episodes/250-authentication-from-scratch-revised
class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.auth = auth
    end
    self.current_user = @user
    redirect_to root_url, notice: "Logged in."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out."
  end

  private

  def auth
    request.env["omniauth.auth"]
  end
end

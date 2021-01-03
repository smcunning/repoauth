class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by(uid: user_info[:uid])
    user.uid = request_hash[:uid]
    user.username = request_hash[:info][:nickname]
    user.token = request_hash[:credentials][:token]
    user.save

    session[:user_id] = user.id

    redirect_to dashboard_path
  end

  private

  def user_info
    request.env['omniauth.auth']
  end
end

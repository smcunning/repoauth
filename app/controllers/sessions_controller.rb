class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by(uid: user_info[:uid])
    user.uid = user_info[:uid]
    user.username = user_info[:info][:nickname]
    user.token = user_info[:credentials][:token]
    user.save

    session[:user_id] = user.id

    redirect_to dashboard_index_path
  end

  private

  def user_info
    request.env['omniauth.auth']
  end
end

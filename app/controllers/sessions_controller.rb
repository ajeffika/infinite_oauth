class SessionsController < ApplicationController
  include RequestHelper
  include LinkHelper

  def create
    begin
      @user = User.oauth_create_user(params[:user_hash][:access_token],
                                     params[:user_hash][:user_data],
                                     params[:user_hash][:user_avatar],
                                     params[:user_hash][:provider],
                                     )
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end
end

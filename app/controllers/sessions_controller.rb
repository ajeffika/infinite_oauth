class SessionsController < ApplicationController
  include RequestHelper
  include LinkHelper

  def create
    user_data_requests
    begin
      @user = User.oauth_create_user(@user_hash[:user_data],
                                     @user_hash[:access_token],
                                     @user_hash[:user_avatar])
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

  private

  def user_data_requests
    @user_hash = { access_token: make_request(access_token_url(params[:code]))['access_token'] }
    @user_hash[:user_data] = make_request(user_data_url(@user_hash[:access_token]))
    @user_hash[:user_avatar] = make_request(profile_picture_url(@user_hash[:user_data]['id']))['data']['url']
  end
end

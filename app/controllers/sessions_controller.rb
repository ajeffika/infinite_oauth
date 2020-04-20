class SessionsController < ApplicationController
  include RequestHelper
  include LinkHelper
  def create
    access_token = make_request(get_access_token(params[:code]))['access_token']
    user_data = make_request(get_user_data(access_token))
    user_avatar = make_request(get_profile_picture(user_data['id']))['data']['url']
    begin
      @user = User.oauth_create_user(user_data, access_token, user_avatar)
      session[:user_id] = @user.id
      # flash[:success] = "Welcome, #{@user.name}!"
    rescue
      # flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      # flash[:success] = 'See you!'
    end
    redirect_to root_path
  end
end

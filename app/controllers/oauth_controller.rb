class OauthController < ApplicationController
  include RequestHelper
  include LinkHelper

  def callback
    @user_hash = { access_token: make_request(access_token_url(params[:code]))['access_token'] }
    @user_hash[:user_data] = make_request(user_data_url(@user_hash[:access_token]))
    @user_hash[:user_avatar] = make_request(profile_picture_url(@user_hash[:user_data]['id']))['data']['url']
    @user_hash[:provider] = 'facebook'
    redirect_to auth_facebook_create_account_path(user_hash: @user_hash)
  end
end
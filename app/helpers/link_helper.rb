module LinkHelper
  require 'securerandom'

  def get_access_token(code)
    "https://graph.facebook.com/v6.0/oauth/access_token?
client_id=1500342126801723
&redirect_uri=http://localhost:3000/auth/facebook/callback
&client_secret=8dd3cdbe7a01e2270db3d2e6df7603db&code=#{code}"
  end

  def get_user_data(access_token)
    "https://graph.facebook.com/me?access_token=#{access_token}"
  end

  def get_profile_picture(user_id)
    "https://graph.facebook.com/#{user_id}/picture?redirect=0&type=normal"
  end

  def authorize_link
    "https://www.facebook.com/v6.0/dialog/oauth?client_id=1500342126801723&redirect_uri=http://localhost:3000/auth/facebook/callback&state=#{SecureRandom.hex}"
  end
end
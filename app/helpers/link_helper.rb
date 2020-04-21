module LinkHelper
  require 'securerandom'

  def access_token_url(code)
    "#{ENV.fetch('FACEBOOK_API_BASE_URL')}/v6.0/oauth/access_token?#{access_token_params(code).to_query}"
  end

  def user_data_url(access_token)
    "#{ENV.fetch('FACEBOOK_API_BASE_URL')}/me?access_token=#{access_token}"
  end

  def profile_picture_url(user_id)
    "#{ENV.fetch('FACEBOOK_API_BASE_URL')}/#{user_id}/picture?redirect=0&type=normal"
  end

  def authorize_link
    "#{ENV.fetch('FACEBOOK_AUTH_BASE_URL')}/v6.0/dialog/oauth?#{authorize_link_params.to_query}"
  end

  private

  def access_token_params(code)
    {
      client_id: ENV.fetch('FACEBOOK_CLIENT_ID'),
      client_secret: ENV.fetch('FACEBOOK_CLIENT_SECRET'),
      redirect_uri: redirect_url,
      code: code
    }
  end

  def authorize_link_params
    {
      client_id: ENV.fetch('FACEBOOK_CLIENT_ID'),
      redirect_uri: redirect_url,
      state: SecureRandom.hex
    }
  end

  def redirect_url
    "#{request.base_url}/auth/facebook/callback"
  end
end
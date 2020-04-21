class User < ApplicationRecord
  class << self
    def oauth_create_user(user_token, auth_hash, user_avatar, provider)
      user = find_or_create_by(uid: auth_hash['id'], provider: provider)
      full_name = auth_hash['name'].split(' ')
      user.name = full_name.first
      user.surname = full_name.drop(1).join(' ')
      user.token = user_token
      user.image_url = user_avatar
      user.save!
      user
    end
  end
end

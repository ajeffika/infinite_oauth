class User < ApplicationRecord
  class << self
    def oauth_create_user(auth_hash, user_token, user_avatar)
      user = find_or_create_by(uid: auth_hash['id'], provider: 'facebook')
      full_name = auth_hash['name'].split(' ')
      surname = full_name.drop(1).join(' ')
      user.name = full_name.first
      user.surname = surname
      user.token = user_token
      user.image_url = user_avatar
      user.save!
      user
    end
  end
end

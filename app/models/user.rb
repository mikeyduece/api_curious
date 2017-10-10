class User < ApplicationRecord

  def self.find_or_create_from_auth(auth)
    require 'pry'; binding.pry
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.email = auth.info.email
      user.image = auth.extra.raw_info.avatar_url
      user.oauth_token = auth.credentials.token
      user.save
    end
  end
end

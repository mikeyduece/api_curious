class User < ApplicationRecord

  def self.find_or_create_from_auth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.email = auth.info.email
      user.image_url = auth.info.image
      user.token = auth.credentials.token
      user.save
    end
  end

  def owned
    CreateRepo.new(nickname).pwned
  end

  def starred_repos
    CreateRepo.new(nickname).starred
    # GithubService.starred_repos(nickname)
  end

  def followers
    FollowSearch.new(nickname).followers
    # GithubService.followers(nickname)
  end

  def following
    FollowSearch.new(nickname).following
    # GithubService.following(nickname)
  end
end

class User < ApplicationRecord

  def self.find_or_create_from_auth(auth)
    user = User.where(uid: auth.uid).first
    if !user.nil? && user.token == auth.credentials.token
      user
    elsif !user.nil?
      user.token = auth.credentials.token
      user.provider = auth.provider
      user.save
      user
    else
      User.create(uid: auth.uid, name: auth.info.name, nickname: auth.info.nickname,
                  token: auth.credentials.token, image_url: auth.info.image,
                  email: auth.info.email, provider: auth.provider)
      user
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

  def organizations
    OrganizationSearch.new(nickname).organization_list
  end
end

class FollowSearch

  def initialize(name)
    @name = name
  end

  def following
    raw_following.map {|raw| Follow.new(raw)}
  end

  def self.commits
    raw_commits
  end
  def followers
    raw_followers.map {|raw| Follow.new(raw)}
  end

  private
    attr_reader :name

    def raw_commits
      service.commits
    end

    def raw_following
      service.following
    end

    def raw_followers
      service.followers
    end

    def service
      GithubService.new(name)
    end
end

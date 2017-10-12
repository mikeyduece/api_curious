class GithubService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.authorization :token, User.find_by_nickname(user).token
      faraday.headers["Accept"] = 'application/vnd.github.cloak-preview+json'
      faraday.headers["X-API-KEY"] = ENV["GITHUB_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.starred_repos
    new(user).starred_repos
  end

  def starred_repos
    get_url("/users/#{user}/starred")
  end

  def self.following
    new(user).following
  end

  def following
    get_url("/users/#{user}/following")
  end

  def followers
    get_url("/users/#{user}/followers")
  end

  def self.followers
    new(user).followers
  end

  def owned
    get_url("/users/#{user}/repos")
  end

  def self.owned
    new(user).owned
  end

  def organizations
    get_url("/users/#{user}/orgs")
  end

  def self.organizations
    new(user).organizations
  end


  private
    attr_reader :user
end

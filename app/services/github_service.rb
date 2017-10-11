class GithubService

  attr_reader :user

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.authorization :token, User.find_by(nickname: user).token
      faraday.headers["X-API-KEY"] = ENV["GITHUB_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.starred_repos(user)
    new(user).starred_repos
  end

  def starred_repos
    get_url("/users/#{user}/starred")
  end
end

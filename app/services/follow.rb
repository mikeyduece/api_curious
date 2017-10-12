class Follow

  attr_reader :name, :image_url, :html_url

  def initialize(repo)
    @name = repo[:login]
    @image_url = repo[:avatar_url]
    @html_url = repo[:html_url]
  end

  def commits
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Accept"] = 'application/vnd.github.cloak-preview+json'
      faraday.headers["X-API-KEY"] = ENV["GITHUB_KEY"]
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/search/commits?q=author:#{name}")
    JSON.parse(response.body)['total_count']
  end
end

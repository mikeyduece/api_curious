require 'date'

class Follow

  attr_reader :name, :image_url, :html_url, :uid

  def initialize(repo)
    @name = repo[:login]
    @image_url = repo[:avatar_url]
    @html_url = repo[:html_url]
    @uid       = repo[:id]
    api_call
  end

  def one_week_ago
    (DateTime.now - 7).to_s
  end

  def api_call
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.authorization :token, "725ba0ecf339d46d8b518dcfc52f13e74ca45b84"
      faraday.headers['If-Modified-Since'] == one_week_ago
      faraday.headers["Accept"] = 'application/vnd.github.cloak-preview+json'
      faraday.headers["X-API-KEY"] = ENV["GITHUB_KEY"]
      faraday.adapter Faraday.default_adapter
    end
    # response = @conn.get("/search/commits?q=author:#{name}&perpage=100")
    # require 'pry'; binding.pry
    # JSON.parse(response.body)
  end


  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def commits
    get_url("/search/commits?q=author:#{name}")[:total_count]
  end
end

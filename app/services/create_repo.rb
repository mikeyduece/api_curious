class CreateRepo

  def initialize(name)
    @name = name
  end

  def pwned
    raw_pwn.map {|raw| Repo.new(raw)}
  end

  def starred
    raw_repo.map do |raw|
      Repo.new(raw)
    end
  end

  private
    attr_reader :name

    def raw_repo
      service.starred_repos
    end

    def raw_pwn
      service.owned
    end

    def service
      GithubService.new(name)
    end
end

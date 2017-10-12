class CreateRepo

  def initialize(name)
    @name = name
  end

  def starred
    raw_repo.map {|raw| Repo.new(raw)}
  end

  private
    attr_reader :name

    def raw_repo
      service.starred_repos
    end

    def service
      GithubService.new(name)
    end
end

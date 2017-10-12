class OrganizationSearch

  def initialize(name)
    @name = name
  end

  def organization_list
    raw_orgs.map {|raw| Organization.new(raw)}
  end

  private
    attr_reader :name

    def raw_orgs
      service.organizations
    end

    def service
      GithubService.new(name)
    end
end

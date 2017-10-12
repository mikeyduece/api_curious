class Repo

  attr_reader :name, :owner_name, :html_url

  def initialize(repo)
    @name = repo[:name]
    @owner_name = repo[:owner][:login]
    @html_url = repo[:html_url]
  end

end

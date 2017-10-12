class Follow

  attr_reader :name, :image_url, :html_url

  def initialize(repo)
    @name = repo[:login]
    @image_url = repo[:avatar_url]
    @html_url = repo[:html_url]
  end

end

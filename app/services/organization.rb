class Organiation

  def initialize(repo)
    @name           = repo[:login]
    @url            = repo[:url]
    @members        = repo[:members_url]
    @public_members = repo[:public_members_url]
    @image          = repo[:avatar_url]
  end
end

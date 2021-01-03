class RepoFacade
  def self.public_repo(current_user)
    all_public_data = RepoService.get_public_repos(current_user)
    all_public_data.map do |repo|
      Repo.new(repo)
    end
  end

  def self.private_repo(current_user)
    all_private_data = RepoService.get_private_repos(current_user)
    all_private_data.map do |repo|
      Repo.new(repo)
    end
  end
end

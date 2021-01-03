class RepoService
  def self.conn(current_user)
    Faraday.new('https://api.github.com', headers: {'Authorization': "token #{current_user.token}"})
  end

  def self.get_public_repos(current_user)
    response = conn(current_user).get('/user/repos?per_page=100&type=public')
    parse_data(response)
  end

  def self.get_private_repos(current_user)
    response = conn(current_user).get('/user/repos?per_page=100&type=private')
    parse_data(response)
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

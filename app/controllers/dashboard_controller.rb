class DashboardController < ApplicationController
  def index

    conn = Faraday.new('https://api.github.com', headers: {'Authorization': "token #{current_user.token}"})
    public_response = conn.get('/user/repos?per_page=100&type=public')
    all_public_data = JSON.parse(public_response.body, symbolize_names: true)
    @public = all_public_data.map do |repo|
      Repo.new(repo)
    end

    private_response = conn.get('/user/repos?per_page=100&type=private')
    all_private_data = JSON.parse(private_response.body, symbolize_names: true)
    @private = all_private_data.map do |repo|
      Repo.new(repo)
    end
  end
end

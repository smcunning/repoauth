class DashboardController < ApplicationController
  def index
    @public = RepoFacade.public_repo(current_user)
    @private = RepoFacade.private_repo(current_user)
  end
end

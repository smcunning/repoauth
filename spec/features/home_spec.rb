require 'rails_helper'

describe 'as a visitor' do
  describe 'on the home page' do
    it 'has a link to login with github' do
      visit root_path
      expect(page).to have_content('RepOAuth')
      expect(page).to have_link('Login with GitHub')
    end
  end
end

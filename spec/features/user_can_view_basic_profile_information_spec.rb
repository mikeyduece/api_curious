require 'rails_helper'

feature 'As a User I can' do
  scenario 'view basic profile information' do
    VCR.use_cassette('profile_info') do
      stub_omniauth

      visit '/'
      click_on('Login with GitHub')

      user = User.last

      expect(page).to have_content(user.email)
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.nickname)
      expect(page).to have_content(user.starred_repos)

      page.should have_xpath("#{user.image_url}")
    end
  end

  scenario 'view my follower and whom I am following' do
    VCR.use_cassette('profile_info') do
      stub_omniauth

      visit '/'
      click_on 'Login with GitHub'

      user = User.last

      expect(page).to have_content(user.followers)
      expect(page).to have_content(user.following)
    end
  end
end

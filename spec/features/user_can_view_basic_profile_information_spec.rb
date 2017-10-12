require 'rails_helper'

feature 'As a User I can' do
  scenario 'view basic profile information' do
    VCR.use_cassette('profile_info', :allow_playback_repeats => true) do
      stub_omniauth

      visit '/'
      click_on('Login with GitHub')

      user = User.last

      expect(page).to have_content(user.email)
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.nickname)
      expect(page).to have_content(user.starred_repos.first.name)
    end
  end

  scenario 'view my follower and whom I am following' do
    VCR.use_cassette('follow_info', :allow_playback_repeats => true) do
      stub_omniauth

      visit '/'
      click_on 'Login with GitHub'

      user = User.last

      expect(page).to have_content(user.followers.first.name)
      expect(page).to have_content(user.following.first.name)
    end
  end
end

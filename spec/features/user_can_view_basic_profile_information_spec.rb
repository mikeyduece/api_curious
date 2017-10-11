require 'rails_helper'

feature 'As a User I can' do
  scenario 'view basic profile information' do
    stub_omniauth

    visit '/'
    click_on('Login with GitHub')

    user = User.last

    expect(page).to have_content(user.email)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.nickname)
    # expect(page).to have_content(user.starred_repos)
    page.should have_xpath("#{user.image_url}")

  end
end

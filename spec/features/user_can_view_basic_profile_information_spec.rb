require 'rails_helper'

feature 'As a User I can' do
  scenario 'view basic profile information' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content(user.email)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.image_url)
    expect(page).to have_content(user.nickname)

  end
end

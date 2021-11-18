# frozen_string_literal: true

feature 'Log in' do
  scenario 'Displays some content' do
    visit('/')
    click_link 'Login'
    expect(page).to have_content 'Log in to MakersBnB'
  end

  scenario 'Displays a form' do
    visit('/login')
    expect(page).to have_button 'Log in'
    expect(page).to have_field 'email_address'
    expect(page).to have_field 'password'
  end

  scenario 'submits a form' do
    visit('/login')
    fill_in 'email_address', with: 'test@testing.com'
    fill_in 'password', with: 'password123'
    click_button 'Log in'
    expect(page).to have_content 'Book a Space'
  end
end

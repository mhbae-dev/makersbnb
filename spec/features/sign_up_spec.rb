# frozen_string_literal: true

feature 'Sign up' do
  scenario 'Displays some content' do
    visit('/')
    expect(page).to have_content 'Sign up'
  end

  scenario 'Displays a form' do
    visit('/')
    expect(page).to have_button 'Sign up'
    expect(page).to have_field 'email_address'
    expect(page).to have_field 'password'
  end
end

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

  it 'a user can log in' do
    User.create('test@example.com', 'password123')
    visit('/login')
    fill_in 'email_address', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Log in'
    expect(page).to have_content 'Book a Space'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create('test@example.com', 'password123')
    visit('/login')
    fill_in 'email_address', with: 'incorrect@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Log in'
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create('test@example.com', 'password123')
    visit('/login')
    fill_in 'email_address', with: 'test@example.com'
    fill_in 'password', with: 'incorrectpass'
    click_button 'Log in'
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out which clears their session' do
    User.create('test@example.com', 'password123')
    visit('/login')
    fill_in 'email_address', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Log in'
    click_link 'Sign out'
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end

  scenario 'user prevented from going to /spaces without loggin in' do
    visit('/spaces')
    expect(page).to have_content 'Log in to MakersBnB'
  end
end

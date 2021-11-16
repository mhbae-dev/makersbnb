feature 'Log in' do
  scenario 'Displays some content' do
    visit('/')
    click_link 'Login'
    expect(page).to have_content 'Log in to MakersBnB'
  end
end

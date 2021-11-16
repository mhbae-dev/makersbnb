feature 'Sign up' do
  scenario 'Displays some content' do
    visit('/')
    expect(page).to have_content 'Sign up'
  end
end

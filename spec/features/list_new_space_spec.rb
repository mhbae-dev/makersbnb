feature 'List a new space' do
  scenario 'Displays some content' do
    visit('/spaces/new')
    expect(page).to have_content 'List a new space'
  end
end

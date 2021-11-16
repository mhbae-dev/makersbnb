feature 'List a new space' do
  scenario 'Displays some content' do
    visit('/spaces/new')
    expect(page).to have_content 'List a new space'
  end

  scenario 'Displays a form' do
    visit('/spaces/new')
    expect(page).to have_button 'List my space'
    expect(page).to have_field 'name'
    expect(page).to have_field 'description'
    expect(page).to have_field 'price_per_night'
  end
  
end

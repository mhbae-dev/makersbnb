feature 'New space form' do
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

  scenario 'Updates database with space once form is submitted' do
    visit('/spaces/new')
    fill_in"name", with: "Tent"
    fill_in"description", with: "8 person tent in field"
    fill_in"price_per_night", with: "20.00"
    click_button "List my space"
    expect(page).to have_content "Tent"
    expect(page).to have_content "8 person tent in field, £20.00"
  end
  
end

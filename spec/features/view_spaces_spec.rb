# frozen_string_literal: true

require 'pg'

require_relative '../../lib/space'

feature 'view spaces' do
  scenario 'displays spaces' do
    # Add the test data
    Space.add(space_name: 'hotel', space_description: 'two bed hotelroom', space_price: '600.00',
              available_from: '2021-10-10', available_to: '2021-05-05')

    visit '/spaces'

    expect(page).to have_content 'hotel'
    expect(page).to have_content 'bed hotelroom, £600.00'
    expect(page).to have_content 'Available from: 2021-10-10, Available to: 2021-05-05'
  end
  
  scenario 'filter by date boxes' do
    Space.add(space_name: 'motel', space_description: 'two bed motelroom', space_price: '600.00',
    available_from: '2021-11-10', available_to: '2022-06-05') 
    Space.add(space_name: 'mini van', space_description: 'two bed minivan', space_price: '700.00',
    available_from: '2021-12-10', available_to: '2022-07-05')          
    visit '/spaces'
    fill_in 'available_from', with: "2021-11-10"
    fill_in 'available_to', with: "2022-01-01"
    expect(page).to have_content 'hotel'
    expect(page).to have_content 'bed hotelroom, £600.00'
    expect(page).to have_content 'Available from: 2021-10-10, Available to: 2021-05-05'
  end


end

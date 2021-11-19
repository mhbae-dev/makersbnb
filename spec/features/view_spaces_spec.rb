# frozen_string_literal: true
require_relative '../../lib/space'
require 'web_helper'

feature 'view spaces' do

  scenario 'displays spaces' do

    # Add the test data
    Space.add(space_name: 'hotel', space_description: 'two bed hotelroom', space_price: '600.00', available_from: '2021-10-10', available_to: '2021-05-05')
    sign_up
    login
    visit '/spaces'
    
    expect(page).to have_content 'hotel'
    expect(page).to have_content 'bed hotelroom, £600.00'
    expect(page).to have_content 'Available from: 2021-10-10, Available to: 2021-05-05'

  end
end



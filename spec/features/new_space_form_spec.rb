# frozen_string_literal: true
require 'web_helper'

feature 'New space form' do
  scenario 'Displays some content' do
    sign_up
    login
    visit('/spaces/new')
    expect(page).to have_content 'List a new space'
  end

  scenario 'Displays a form' do
    sign_up
    login
    visit('/spaces/new')
    expect(page).to have_button 'List my space'
    expect(page).to have_field 'name'
    expect(page).to have_field 'description'
    expect(page).to have_field 'price_per_night'
    expect(page).to have_field 'available_from'
    expect(page).to have_field 'available_to'
  end

  scenario 'Updates database with space once form is submitted' do
    sign_up
    login
    visit('/spaces/new')
    fill_in 'name', with: 'Tent'
    fill_in 'description', with: '8 person tent in field'
    fill_in 'price_per_night', with: '20.00'
    fill_in 'available_from', with: '2021-10-28'
    fill_in 'available_to', with: '2021-10-05'
    click_button 'List my space'
    expect(page).to have_content 'Tent'
    expect(page).to have_content '8 person tent in field, £20.00'
    expect(page).to have_content 'Available from: 2021-10-28, Available to: 2021-10-05'
  end
end

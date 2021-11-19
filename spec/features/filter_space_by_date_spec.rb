require_relative '../../lib/space'
require_relative'./web_helper.rb'

feature 'filter' do

  scenario 'initially shows all spaces and let the user know' do
    sign_up
    login
    add_two_spaces_and_visit_spaces_page

    expect(page).to have_content 'Showing all available spaces'
    expect(page).to have_button 'Remove Filter'

    expect(page).to have_content 'motel'
    expect(page).to have_content 'bed motelroom, £600.00'
    expect(page).to have_content 'Available from: 2021-01-01, Available to: 2022-01-01'

    expect(page).to have_content 'mini van'
    expect(page).to have_content 'two bed minivan, £700.00'
    expect(page).to have_content 'Available from: 2021-01-01, Available to: 2021-02-01'
  end

  scenario 'only shows spaces within date range' do
    sign_up
    login
    add_two_spaces_and_visit_spaces_page

    fill_in_filter_dates_and_submit

    expect(page).to have_content 'Showing spaces available from: 2021-01-01 and available to: 2022-01-01'

    expect(page).to have_button 'Remove Filter'

    expect(page).to have_content 'motel'
    expect(page).to have_content 'bed motelroom, £600.00'
    expect(page).to have_content 'Available from: 2021-01-01, Available to: 2022-01-01'

    expect(page).to have_no_content 'mini van'
    expect(page).to have_no_content 'two bed minivan, £700.00'
    expect(page).to have_no_content 'Available from: 2021-01-01, Available to: 2021-02-01'
  end

  scenario 'removes filter when click on remove filter button' do
    sign_up
    login
    add_two_spaces_and_visit_spaces_page

    fill_in_filter_dates_and_submit

    expect(page).to have_button 'Remove Filter'
    click_button 'Remove Filter'

    expect(page).to have_content 'Showing all available spaces'
    expect(page).to have_no_content 'Remove Filter'

    expect(page).to have_content 'motel'
    expect(page).to have_content 'bed motelroom, £600.00'
    expect(page).to have_content 'Available from: 2021-01-01, Available to: 2022-01-01'

    expect(page).to have_content 'mini van'
    expect(page).to have_content 'two bed minivan, £700.00'
    expect(page).to have_content 'Available from: 2021-01-01, Available to: 2021-02-01'
  end
end
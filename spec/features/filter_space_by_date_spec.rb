require_relative '../../lib/space'
require_relative'./web_helper.rb'

feature 'filter' do

  scenario 'shows spaces within date range' do

    add_two_spaces_and_visit_spaces_page

    fill_in_filter_dates_and_submit

    expect(page).to have_content 'motel'
    expect(page).to have_content 'bed motelroom, £600.00'
    expect(page).to have_content 'Available from: 2021-01-01, Available to: 2022-01-01'

  end

  scenario 'does not show spaces outside date range' do
    
    add_two_spaces_and_visit_spaces_page

    fill_in_filter_dates_and_submit

    expect(page).to have_no_content('mini van')
    expect(page).to have_no_content('two bed minivan, £700.00')
    expect(page).to have_no_content('Available from: 2021-01-01, Available to: 2021-02-01')

  end

end
def add_two_spaces_and_visit_spaces_page
  # available for a year
  Space.add(space_name: 'motel', space_description: 'two bed motelroom', space_price: '600.00',
    available_from: '2021-01-01', available_to: '2022-01-01') 
    # available for a month
  Space.add(space_name: 'mini van', space_description: 'two bed minivan', space_price: '700.00',
    available_from: '2021-01-01', available_to: '2021-02-01') 

  visit '/spaces'

end

def fill_in_filter_dates_and_submit
  # ask for whole year availability
  fill_in 'available_from', with: "2021-01-01"
  fill_in 'available_to', with: "2022-01-01"

  click_button 'List Space'

end
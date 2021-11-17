require 'pg'

feature 'view spaces' do
  scenario 'displays spaces' do

    conn = PG.connect(dbname: 'makersbnb_test')

    # Add the test data
    conn.exec("INSERT INTO spaces (name,description,price) VALUES ('hotel','two bed hotelroom', 600.00);")
    conn.exec("INSERT INTO spaces (name,description,price) VALUES ('penthouse','penthouse w/ hot tub', 1000.00);")
    conn.exec("INSERT INTO spaces (name,description,price) VALUES ('motel','single bed', 200.00);")

    visit '/spaces'

    expect(page).to have_content 'hotel' 
    expect(page).to have_content 'bed hotelroom, £600.00'
    expect(page).to have_content 'penthouse'
    expect(page).to have_content 'w/ hot tub, £1000.00'
    expect(page).to have_content 'motel' 
    expect(page).to have_content 'single bed, £200.00'

  end
end
require 'pg'

feature 'view spaces' do
  scenario 'displays spaces' do
    visit '/'

    conn = PG.connect(dbname: 'makersbnb_test')

    # Add the test data
    conn.exec("INSERT INTO spaces (name,description,price) VALUES ('hotel','two bed hotelroom', 600.00);")
    conn.exec("INSERT INTO spaces (name,description,price) VALUES ('penthouse','penthouse w/ hot tub', 1000.00);")
    conn.exec("INSERT INTO spaces (name,description,price) VALUES ('motel','single bed', 200.00);")

    expect(page).to have_content 'hotel, two bed hotelroom, £600.00'
    expect(page).to have_content 'penthouse, penthouse w/ hot tub, £1000.00'
    expect(page).to have_content 'motel, single bed, £200.00'

  end
end
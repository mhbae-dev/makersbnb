require 'pg'
require_relative './../lib/space.rb'

describe Space do
  
  describe '.all' do
    it 'returns a list of spaces' do

    conn = PG.connect(dbname: 'makersbnb_test')
  
    # Add the test data
    conn.exec("INSERT INTO spaces (name,description,price) VALUES ('hotel','two bed hotelroom', 600.00);")
    conn.exec("INSERT INTO spaces (name,description,price) VALUES ('penthouse','penthouse w/ hot tub', 1000.00);")
    conn.exec("INSERT INTO spaces (name,description,price) VALUES ('motel','single bed', 200.00);")
    
    spaces = Space.all

    expect(spaces).to include(["hotel", "two bed hotelroom", "600.00"])
    expect(spaces).to include(["penthouse", "penthouse w/ hot tub", "1000.00"])
    expect(spaces).to include(["motel", "single bed", "200.00"])
    end
  end

  # it 'returns the spaces name'

  # end

  # it 'returns the spaces description'

  # end

  # it 'returns the spaces price'

  # end

end
require 'pg'
require_relative './../lib/space.rb'

describe Space do
  
  describe '.all' do
    it 'returns a list of spaces' do

    conn = PG.connect(dbname: 'makersbnb_test')
  
    # Add the test data
    conn.exec("INSERT INTO spaces (name,description,price,available_from,available_to) VALUES ('hotel','two bed hotelroom', 600.00, '2021-10-10', '2021-05-05');")
    
    spaces = Space.all

    expect(spaces).to include(["hotel", "two bed hotelroom", "600.00", "2021-10-10", "2021-05-05"])

    end
  end

  # it 'returns the spaces name'

  # end

  # it 'returns the spaces description'

  # end

  # it 'returns the spaces price'

  # end

end
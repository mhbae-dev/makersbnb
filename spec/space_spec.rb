# frozen_string_literal: true

require 'pg'
require_relative './../lib/space'

describe Space do
  describe '.all' do
    it 'returns a list of spaces' do
      conn = PG.connect(dbname: 'makersbnb_test')

      # Add the test data
      conn.exec("INSERT INTO spaces (name,description,price,available_from,available_to) VALUES ('hotel','two bed hotelroom', 600.00, '2021-10-10', '2021-05-05');")

      spaces = Space.all

      expect(spaces).to include(['hotel', 'two bed hotelroom', '600.00', '2021-10-10', '2021-05-05'])
    end
  end

  describe '.add' do
    it 'adds a space to the list' do
      Space.add(space_name: 'tent', space_description: 'three person', space_price: '40.00',
                available_from: '2022-11-12', available_to: '2023-06-06')

      spaces = Space.all

      expect(spaces).to include(['tent', 'three person', '40.00', '2022-11-12', '2023-06-06'])
    end
  end

  # it 'returns the spaces name'

  # end

  # it 'returns the spaces description'

  # end

  # it 'returns the spaces price'

  # end
end

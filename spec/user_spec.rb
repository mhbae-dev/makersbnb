require 'pg'
require 'user'

describe User do
  describe '.create' do
    it 'adds a user to the users table in the makersbnb database' do
      # let(:users_table){conn = PG.connect(dbname: 'makersbnb')
      # conn.exec(
      #   "();",
      # )}
      connection = PG.connect(dbname: 'makersbnb')
      result = connection.exec('SELECT * FROM users;')
      result.map { |user| }
      p result.map { |user| }
      User.create('test@testing.com', 'password123')

      expect(result.map { |user| }).to include 'test@testing.com'
      expect(result.map { |user| }).to include 'password123'
    end
  end
end

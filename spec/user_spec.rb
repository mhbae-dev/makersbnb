require 'pg'
require 'user'

describe User do
  describe '.create' do
    it 'adds a user to the users table in the makersbnb database' do
      # let(:users_table){conn = PG.connect(dbname: 'makersbnb')
      # conn.exec(
      #   "();",
      # )}
      connection = PG.connect(dbname: 'makersbnb_test')
      result = connection.exec('SELECT * FROM users;')
      user_array = result.map { |user| user['email_address'] }
      User.create('test@testing.com', 'password123')

      expect(user_array).to include 'test@testing.com'
      expect(user_array).to include 'password123'
    end
  end
end

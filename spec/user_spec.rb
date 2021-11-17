require 'pg'
require 'user'

describe User do
  describe '.create' do
    let(:users_table) do
      connection = PG.connect(dbname: 'makersbnb_test')
      result = connection.exec('SELECT * FROM users;')
      result.map { |user| User.new(user['email_address'], user['password']) }
    end
    it 'adds a user to the users table in the makersbnb database' do
      User.create('test@testing.com', 'password123')
      expect(users_table[0].email_address).to include 'test@testing.com'
      expect(users_table[0].password).to include 'password123'
    end
  end
end

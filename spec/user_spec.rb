# frozen_string_literal: true

require 'pg'
require 'user'

describe User do
  describe '.create' do
    let(:users_table) do
      connection = PG.connect(dbname: 'makersbnb_test')
      result = connection.exec('SELECT * FROM users;')
      result.map { |user| User.new(user['id'], user['email_address']) }
    end
    it 'adds a user to the users table in the makersbnb database' do
      user = User.create('test@testing.com', 'password123')
      expect(user).to be_a User
      expect(user.id).to eq users_table[0].id
      expect(user.email_address).to eq users_table[0].email_address
    end
  end

  describe '.check' do
    context 'user exists in the database' do
      before do
        User.create('test@testing.com', 'password123')
        User.create('test2@testing.com', 'password456')
      end
      let(:email_address) { 'test@testing.com' }
      let(:password) { 'password123' }
      it 'checks if the form data exists in the users table' do
        @user = User.new(email_address, password)
        user_check = User.check(email_address, password)
        expect(user_check).to be true
      end
    end

    context 'user does not exist in the database' do
      before do
        User.create('test@testing.com', 'password123')
        User.create('test2@testing.com', 'password456')
      end

      let(:email_address) { 'incorrectemail@testing.com' }
      let(:password) { 'incorrectpassword' }
      it 'checks if the form data exists in the users table' do
        @user = User.new(email_address, password)
        user_check = User.check(email_address, password)
        expect(user_check).to be false
      end
    end
  end
end

# frozen_string_literal: true

require 'pg'
require 'user'
require 'bcrypt'

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

    it 'encrypts password' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create('test@example.com', 'password123')
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end

    context 'user exists in the database' do
      it 'checks if the form data exists in the users table' do
        user = User.create('test@testing.com', 'password123')
        user_check = User.find(user.id)
        expect(user_check.id).to eq user.id
        expect(user_check.email_address).to eq user.email_address
      end
    end

    describe '.check' do
      it 'user exists in the database' do
        user = User.create('test@testing.com', 'password123')
        checked_user = User.check('test@testing.com', 'password123')

        expect(checked_user.id).to eq user.id
      end

      it 'returns nil given an incorrect email address' do
        user = User.create('test@testing.com', 'password123')

        expect(User.check('incorrect@example.com', 'password123')).to be_nil
      end

      it 'returns nil given an incorrect password' do
        user = User.create('test@testing.com', 'password123')

        expect(User.check('test@example.com', 'incorrectpass')).to be_nil
      end
    end
  end
end

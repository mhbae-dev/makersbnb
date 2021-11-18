# frozen_string_literal: true

require 'pg'
require 'bcrypt'

class User
  attr_reader :email_address, :password

  def initialize(email_address, password)
    @email_address = email_address
    @password = password
  end

  def self.create(email_address, password)
    encrypted_password = BCrypt::Password.create(password)

    conn =
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'makersbnb_test')
      else
        PG.connect(dbname: 'makersbnb')
      end
    conn.exec(
      "INSERT INTO users (email_address, password) VALUES('#{email_address}', '#{encrypted_password}');",
    )
  end

  def self.check(email_address, password)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'makersbnb_test')
    else
      conn = PG.connect(dbname: 'makersbnb')
    end
    result = conn.exec('SELECT * FROM users;')
    result_array =
      result.map { |user| User.new(user['email_address'], user['password']) }

    result_array.each do |user|
      if user.email_address == email_address && user.password == password
        return true
      else
        return false
      end
    end
  end
end

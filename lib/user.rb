# frozen_string_literal: true

require 'pg'

class User
  attr_reader :id, :email_address

  def initialize(id, email_address)
    @id = id
    @email_address = email_address
  end

  def self.create(email_address, password)
    conn =
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'makersbnb_test')
      else
        PG.connect(dbname: 'makersbnb')
      end
    result =
      conn.exec(
        "INSERT INTO users (email_address, password) VALUES('#{email_address}', '#{password}') RETURNING id, email_address;",
      )
    User.new(result[0]['id'], result[0]['email_address'])
  end

  # def self.check(email_address, password)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     conn = PG.connect(dbname: 'makersbnb_test')
  #   else
  #     conn = PG.connect(dbname: 'makersbnb')
  #   end
  #   result = conn.exec('SELECT * FROM users;')
  #   result_array =
  #     result.map { |user| User.new(user['id'], user['email_address']) }

  #   result_array.each do |user|
  #     if user.email_address == email_address
  #       return true
  #     else
  #       return false
  #     end
  #   end
  # end

  def self.find(id)
    return nil unless id
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'makersbnb_test')
    else
      conn = PG.connect(dbname: 'makersbnb')
    end
    result = conn.exec('SELECT * FROM users WHERE id = id;')
    User.new(result[0]['id'], result[0]['email_address'])
  end
end

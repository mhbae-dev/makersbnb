require 'pg'

class User
  def self.create(email_address, password)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'makersbnb_test')
    else
      conn = PG.connect(dbname: 'makersbnb')
    end
    conn.exec(
      "INSERT INTO users (email_address, password) VALUES('#{email_address}', '#{password}');",
    )
  end
end

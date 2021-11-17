class User
  def self.create(email_address, password)
    conn = PG.connect(dbname: 'makersbnb')
    conn.exec(
      "INSERT INTO users (email_address, password) VALUES('#{email_address}', '#{password}');",
    )
  end
end

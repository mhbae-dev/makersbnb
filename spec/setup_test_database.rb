# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'Setting up test database...'

  conn = PG.connect(dbname: 'makersbnb_test')

  # Clear the spaces table
  conn.exec('TRUNCATE spaces;')
  conn.exec('TRUNCATE users;')
end

# frozen_string_literal: true

def set_environment
  if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'makersbnb_test')
  else
    PG.connect(dbname: 'makersbnb')
  end
end

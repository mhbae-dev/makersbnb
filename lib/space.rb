require 'pg'       
  
class Space
  #comment

  # attr_reader :name, :description, :price

  # def initialize(name, description, price)
  #   @name = name
  #   @description = description
  #   @price = price
  # end
    
  def self.all     
    if ENV['ENVIRONMENT'] == 'test'    
      conn = PG.connect(dbname: 'makersbnb_test')    
    else    
      conn = PG.connect(dbname: 'makersbnb')    
    end    
    
    result = conn.exec("SELECT * FROM spaces;")    
    
    result.map { |space| [space['name'], space['description'],space['price']] }
  end

end
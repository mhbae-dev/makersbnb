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

  def self.add(space_name:, space_description:, space_price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("INSERT INTO spaces (name, description, price) VALUES('#{space_name}','#{space_description}','#{space_price}');")
  end
end

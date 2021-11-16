require 'pg'       
  
class Space
    
  def self.all     

    if ENV['ENVIRONMENT'] == 'test'    
      conn = PG.connect(dbname: 'makersbnb_test')    
    else    
      conn = PG.connect(dbname: 'makersbnb')    
    end    
    
    result = conn.exec("SELECT * FROM spaces;")    
    
    result.map { |space| space['name'] }
  
  end

end
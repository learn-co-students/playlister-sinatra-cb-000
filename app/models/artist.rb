class Artist 
  
  has_many :songs 
  has_many :genres, :through => :songs
  
  
  
end 
class Song  
  
  belong_to :artist 
  has_many :genres, :through => :song_genres
  
  
  
end 
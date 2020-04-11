class Genre 
  
  has_many :artists, :through => :songs
  has_many :songs, :through => :song_genres
  
  
  
end 
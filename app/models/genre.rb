class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
<<<<<<< HEAD
  has_many :artists, through: :songs
=======
  has_many :artists
>>>>>>> a0c482745f51ae393254ea685e43d8a459363829
end

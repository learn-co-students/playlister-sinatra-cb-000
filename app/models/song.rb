class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
<<<<<<< HEAD
  belongs_to :artist
=======
  has_one :artist
>>>>>>> a0c482745f51ae393254ea685e43d8a459363829
end

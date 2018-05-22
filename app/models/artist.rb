class Artist < ActiveRecord::Base
  has_many :songs
<<<<<<< HEAD
  has_many :genres, through: :songs
=======
  has_many :genres
>>>>>>> a0c482745f51ae393254ea685e43d8a459363829
end

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  # i dont understand what im doing.

end

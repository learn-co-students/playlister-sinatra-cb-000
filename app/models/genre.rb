class Genre < ActiveRecord::Base
  # has_many :artist_genres
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub ' ', '-'
  end

  def self.find_by_slug(input)
    # binding.pry
    self.all.detect {|artist| artist.slug == input}
  end

end

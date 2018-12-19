class Artist < ActiveRecord::Base
  has_many :songs
  has_many :artist_genres
  has_many :genres, through: :artist_genres

  def slug
    self.name.downcase.gsub ' ', '-'
  end

  def self.find_by_slug(input)
    # binding.pry
    Artist.all.detect {|artist| artist.slug == input}
  end

end

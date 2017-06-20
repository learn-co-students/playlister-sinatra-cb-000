class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.gsub(/\W/, '-').downcase
  end

  def self.find_by_slug(slug)
    Genre.all.select do |genre|
      genre if genre.slug == slug
    end.first
  end
end

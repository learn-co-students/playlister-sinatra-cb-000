class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.gsub(/\W/, '-').downcase
  end

  def self.find_by_slug(slug)
    Song.all.select do |song|
      song if song.slug == slug
    end.first
  end
end
